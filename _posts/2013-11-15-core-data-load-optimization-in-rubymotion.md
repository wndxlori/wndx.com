---
layout: core-data-book
title: Core Data Load Optimization in RubyMotion
categories:
- products
tags:
- core data
- ruby
- rubymotion
status: publish
published: true
meta:
  _thumbnail_id: '127'
---

Updated July 13, 2015

Today we'll be revisiting our previous topic, 
[Core Data Pre-loading in Ruby Motion](/blog/core-data-pre-loading-in-rubymotion).  If you've missed the earlier posts, you can find them here:


[Introduction to Core Data in Motion](/blog/core-data-in-motion)


[Core Data Basics in RubyMotion](/blog/core-data-basics-in-rubymotion)


[Core Data Relationships in RubyMotion](/blog/core-data-relationships-in-rubymotion)


[Core Data Pre-loading in RubyMotion](/blog/core-data-pre-loading-in-rubymotion)


At the end of our pre-loading post, I mentioned that there was a problem with our load, when presented with a (much) larger dataset.  As it turns out, there are several issues.  Let's review these problems one at a time.


First of all, we have the problematic JSON data load.

```ruby
# Finds and opens the json file, from the resources dir, which
# contains the data to be loaded
path = NSBundle.mainBundle.pathForResource("Banks", ofType:"json")
banks = BW::JSON.parse(NSData.dataWithContentsOfFile(path))
```

As you can see, this code reads in the JSON file in one large gulp, then parses the whole thing into one big in-memory array.  With my much larger dataset (**244,292** records), these two lines represent two places where my application will run out of memory. This clearly isn't going to work.


Second problem, the 
add_bank method.

```ruby
def add_bank
    # Yield a blank, newly created bank entity, then save the model.
    yield NSEntityDescription.insertNewObjectForEntityForName('FailedBankInfo',
                                                              inManagedObjectContext:@context),
          NSEntityDescription.insertNewObjectForEntityForName('FailedBankDetails',
                                                              inManagedObjectContext:@context)
    save
  end
```

In this earlier example, we simply add banks, one at a time, and each bank is saved to the database as it is added.  But add, save, add, save, add, save, etc, is not exactly the most efficient code.  For my 244k records, it REALLY, REALLY sucks.  We'll need to batch those saves.


I'll jump ahead here, and note that even when you batch all the saves, while running in the REPL, with the large data load, you'll still eventually run out of memory in the simulator while trying to run the load.  So that's challenge number three.


Now that we have a grasp of everything that's wrong with the previous code, let's figure out how to fix it.
  
      
![](/squarespace_images/static_50d2902fe4b0959a0871a12c_50d29312e4b04687d9db341b_55a02d1ce4b0da93269fdc54_1436560669435__img.png){: .img-responsive .center-block}

Here is the whole solution, but we'll break it down as we go.

```ruby
def self.load
    $stdout.sync = true

    # Finds and opens a CSV file, from the resources dir, which contains the data to be loaded
    path = NSBundle.mainBundle.pathForResource("abandoned_wells_20130513", ofType:"csv")
    loaded = 0
    FCSV.foreach( path, headers: true ) do |row|
      FailedBankStore.shared.create_bank do |info, details|
        info.name = row[3]
        info.city = row[5]
        info.state = 'AB'
        details.update_date = NSDate.dateWithNaturalLanguageString(row[6]) || NSDate.date
        details.close_date = NSDate.date
        details.zip = row[4].to_i
        info.details = details
      end
      # saves records to the store in batches of 100
      loaded += 1
      if ((loaded % 100) == 0)
        FailedBankStore.shared.save
        # prints progress for batches of 100, with marker '*' for 1000's
        print ((loaded % 1000) != 0) ? '.' : '*'
      end
    end
    # One more save, for the odd batch at the end
    FailedBankStore.shared.save
    puts "Loaded #{loaded} banks"
  end
```

Starting with reading in the data file in a slightly ;-) more efficient manner this time.

```ruby
# Finds and opens a CSV file, from the resources dir, which contains the data to be loaded
path = NSBundle.mainBundle.pathForResource("abandoned_wells_20130513", ofType:"csv")
loaded = 0
FCSV.foreach( path, headers: true ) do |row|
```

My real-live dataset happens to be a CSV file this time, so we'll use the FasterCSV gem, and stream the file, reading in the rows as we go.  That solves problem number one quite handily.


Next up, how about we batch up those object saves to the database?  Still inside our CSV row loop:

```ruby
FailedBankStore.shared.create_bank do |info, details|
        info.name = row[3]
        info.city = row[5]
        info.state = 'AB'
        details.update_date = NSDate.dateWithNaturalLanguageString(row[6]) || NSDate.date
        details.close_date = NSDate.date
        details.zip = row[4].to_i
        info.details = details
      end
```

Now we have a new 
create_bank method, which differs in only one respect from the 
add_bank, omitting the save.  And that 
create_bank looks like:

```ruby
def create_bank
    yield NSEntityDescription.insertNewObjectForEntityForName('FailedBankInfo',
                                                              inManagedObjectContext:@context),
          NSEntityDescription.insertNewObjectForEntityForName('FailedBankDetails',
                                                              inManagedObjectContext:@context)
  end
```

Which is basically indentical to the old 
add_bank, without the save.  Continuing in our CSV row loop we see:

```ruby
# saves records to the store in batches of 100
  loaded += 1
  if ((loaded % 100) == 0)
    FailedBankStore.shared.save
    # prints progress for batches of 100, with marker '*' for 1000's
    print ((loaded % 1000) != 0) ? '.' : '*'
  end
```

After the new object is populated, we increment our load count.  Every time we hit an even 100, we save.  For the sake of the poor sucker running this load, we also print out a . for each 100, and a * for each 1000, so the progress of the load can be monitored. Yes, I added that, because I was the poor sucker that wanted a progress monitor.  This is an really handy idiom, and I wish more programs would use it.


I'll also point out that if you want to see those progress dots, don't neglect to add  
$stdout.sync = true (at the beginning, before the loop), otherwise your progress output will flush out in batches, which kind of defeats the purpose of doing it.


Now, that we've reached the end of our CSV row loop we have:

```ruby
FailedBankStore.shared.save
puts "Loaded #{loaded} banks"
```

Since we are unlikely to finish on an even 100 boundary, this 
save takes care of the odd batch at the end, and prints out the actual number of records loaded, so we know that we got it all.  And that's it for batching our saves more efficiently.  So much for problem number two.


Last up is our third challenge, what do we do about running out of memory in the simulator?


Turns out that Ray Wenderlich's Core Data tutorial was re-written with exactly this problem in mind. 
[Core Data on iOS 5 Tutorial: How To Preload and Import Existing Data](http://www.raywenderlich.com/12170/core-data-tutorial-how-to-preloadimport-existing-data-updated)


The solution is to not run in the iOS simulator. 
[RubyMotion](http://rubymotion.com) can create OS X applications just as easily.  And the Core Data API's for iOS and OS X are identical in these cases.  You can just use the same models in an OS X app, and run this load with all the memory and power you need.  Simple, no?


We'll go ahead and create an OS X RubyMotion app:

```bash
motion create --template=osx FailedBankLoad
```

I got lazy, and symlinked in the model files from the iOS app into this project, but you can copy them over if you like.  Just to make certain that the models are linked in to the app when it is compiled, I invoked the shared singleton store from the app_delegate here:

```ruby
  def applicationDidFinishLaunching(notification)
    buildMenu
    buildWindow
    FailedBankStore.shared
  end
```

Then you can just compile and run your new OS X app with 
rake, and when the REPL comes up, run the load method like so:

```ruby
FailedBankStore.load
```

And sit back and watch the data load progress.  The OS X load application can be found here: 
[FailedBankLoad](https://github.com/wndxlori/WNDXRubyMotion/tree/large-data-load/FailedBankLoad).  When the load completes, you should have a shiny new, stuffed full, SQLite database in a file called 
banks.sqlite in your Documents directory.  You'll want to copy that back into the resources directory of your iOS appplication.  And that is a complete, huge data, pre-load for your iOS application.


I wouldn't want you to go away thinking we had finished, because we haven't.  We'll still need to display that data in the table view of our iOS application, and if you think that 244k records will "just work", well, you would be incorrect.  We really don't want to load up the whole dataset to do that.  So, in our next installment, we will be examining the use of 
NSFetchedResultsController to manage our unwieldy dataset properly.


Until then…


If you found this post enlightening, you will find the ebook I wrote on these topics (and more) will allow you to spend more time working on your iOS application features, instead of fighting with Core Data for hours (or days).
