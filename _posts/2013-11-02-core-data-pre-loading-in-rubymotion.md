---
layout: post
title: Core Data Pre-Loading in RubyMotion
categories:
- Core Data
- RubyMotion
tags:
- Core Data
- ruby
- rubymotion
status: publish
type: post
published: true
meta:
  _thumbnail_id: '147'
---

![](/squarespace_images/static_50d2902fe4b0959a0871a12c_50d29312e4b04687d9db341b_558d970de4b0dba0791c4cfd_1435342609853_preload.jpg_)
  


Updated June 26, 2015


Once again, we are talking about using Core Data in 
[RubyMotion](http://rubymotion.com).  If you've missed the earlier posts, you can find them here:


[Introduction to Core Data in Motion](http://www.wndx.com/blog/core-data-in-motion)


[Core Data Basics in RubyMotion](http://www.wndx.com/blog/core-data-basics-in-rubymotion)


[Core Data Relationships in RubyMotion](http://www.wndx.com/blog/core-data-relationships-in-rubymotion)


This week, we are delving into loading up that Core Data store with a pre-populated set of data.  Once again, Ray Wenderlich's Core Data tutorial offers us a great starting point. 
[Core Data on iOS 5 Tutorial: How To Preload and Import Existing Data](http://www.raywenderlich.com/12170/core-data-tutorial-how-to-preloadimport-existing-data-updated)


When I initially started this series, this tutorial had not be re-written.  It eventually ended up at the same place I did, however, so let's just start at the beginning, and see how we eventually get there.  Just as a reminder, all the code for this series is based on Ray's example, and can be found 
[here](I%20have%20created%20a%20RubyMotion%20project%20to%20illustrate%20this%20based%20on%20his%20%22Failed%20Banks%22%20example.%20%20You%20can%20find%20my%20project%20%5Bhere%5D(https://github.com/wndxlori/WNDXRubyMotion/tree/master/FailedBankCD). And all the code relevant to this post can be found in this 
[branch](https://github.com/wndxlori/WNDXRubyMotion/tree/import-preload-data).


In the 
[basics](http://www.wndx.com/blog/core-data-basics-in-rubymotion) and 
[relationships](http://www.wndx.com/blog/core-data-relationships-in-rubymotion) posts, we have already created our models, dealt with the persistent store coordinator, managed object context, and the managed object model, and then wired our models together with relationships.  So that is our starting point for this exercise.


This is our load function, as translated from Ray's example, to start.


def self.load
    # Finds and opens the json file, from the resources dir, which contains the data to be loaded
    path = NSBundle.mainBundle.pathForResource("Banks", ofType:"json")
    banks = BW::JSON.parse(NSData.dataWithContentsOfFile(path))
    puts(banks)
    banks.each do |bank|
      FailedBankStore.shared.add_bank do |info, details|
        info.name = bank['name']
        info.city = bank['city']
        info.state = bank['state']
        details.close_date = NSDate.dateWithNaturalLanguageString(bank['closeDate'])
        details.update_date = NSDate.date
        details.zip = bank['zip']
        info.details = details
      end
    end
  end


That's a bit of a wall of text, so let's break it down.  First step, finding the JSON file that contains the data, and reading it in.


# Finds and opens the json file, from the resources dir, which 
    # contains the data to be loaded
    path = NSBundle.mainBundle.pathForResource("Banks", ofType:"json")
    banks = BW::JSON.parse(NSData.dataWithContentsOfFile(path))


The JSON file - 
Banks.json', is located in your RubyMotion project's 
resources directory.  Then we use the ever-useful 
[BubbleWrap](http://bubblewrap.io) library's JSON methods to read in the data.  This yields to us an array of bank objects, which are essentially Hashes.


Since we have an array, we'll now iterate through it, and 
add_bank for each, populating the bank info and bank detail entities with the related values.


banks.each do |bank|
      FailedBankStore.shared.add_bank do |info, details|
        info.name = bank['name']
        info.city = bank['city']
        info.state = bank['state']
        details.close_date = NSDate.dateWithNaturalLanguageString(bank['closeDate'])
        details.update_date = NSDate.date
        details.zip = bank['zip']
        info.details = details
      end
    end


For clarity's sake, it's probably worth a look at the 
add_bank method, which simply creates and yields the new bank info and bank details entities for us, and saves the populated objects into the managed context.


def add_bank
    # Yield a blank, newly created bank entity, then save the model.
    yield NSEntityDescription.insertNewObjectForEntityForName('FailedBankInfo', inManagedObjectContext:@context),
        NSEntityDescription.insertNewObjectForEntityForName('FailedBankDetails', inManagedObjectContext:@context)
    save
  end


Now that we have all that, all we have to do is run our project in the simulator (
rake), and invoke 
FailedBankStore.load from the REPL, and bingo, we have a pre-populated SQLite database.  The next time you run your app, you'll see the all the data you just loaded.


That seems pretty simple, doesn't it?  And it is.  Pretty simple.  Or maybe I should say, pretty simplistic.  This actually works quite well, with a relatively small data set.  This example, with a working set of data, can be downloaded and run from this 
[branch](https://github.com/wndxlori/WNDXRubyMotion/tree/import-preload-data) of the repository.


However, once you start dealing with larger datasets (mine had 244,292 items), you will find this simple case breaks down rapidly. How we deal with really large datasets is, of course, our next topic. :-)


Until then…


If you found this post enlightening, you will find the ebook I wrote on these topics (and more) will allow you to spend more time working on your iOS application features, instead of fighting with Core Data for hours (or days).
