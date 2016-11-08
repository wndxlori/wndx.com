---
layout: post
title: Core Data with NSFetchedResultsController in RubyMotion
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
  _thumbnail_id: '144'
---

Updated July 12, 2015.


Today we'll be continuing our series on 
[Core Data in RubyMotion](http://coredatainmotion.com), discussing table view optimization of large amounts of data in your RubyMotion application.  If you've missed the earlier posts, you can find them here:


[Introduction to Core Data in Motion](http://www.wndx.com/blog/core-data-in-motion)


[Core Data Basics in RubyMotion](http://www.wndx.com/blog/core-data-basics-in-rubymotion)


[Core Data Relationships in RubyMotion](http://www.wndx.com/blog/core-data-relationships-in-rubymotion)


[Core Data Pre-loading in RubyMotion](http://www.wndx.com/blog/core-data-pre-loading-in-rubymotion)


[Core Data Load Optimization in RubyMotion](http://www.wndx.com/blog/core-data-load-optimization-in-rubymotion)


Once again, we turn to Ray Wenderlich for inspiration and instruction.  His 
[Core Data tutorial](http://www.raywenderlich.com/999/core-data-tutorial-for-ios-how-to-use-nsfetchedresultscontroller) wraps up with a post on the usage of 
NSFetchedResultsController, so we should probably talk about that as well.


Why do we want to use 
NSFetchedResultsController, anyway?  What's so special about it?  When we started this series, with a relatively small sample dataset, it didn't really need much optimization.  Now that we've loaded our database up with all 244,292 wells, it definitely needs some help, because I don't want my customers to wait 
minutes for the table view to load, which is what it does at this point. That is what I would call a fetch 
FAIL.
  
       [caption id="" align="alignnone" width="1325.0"]
![Source: http://sadmoment.com/dog-meets-tree-while-playing-fetch-in-the-park-with-a-frisbee/](/squarespace_images/static_50d2902fe4b0959a0871a12c_50d29312e4b04687d9db341b_55a30b61e4b0359ca412be9e_1436748642620_fetch-fail.jpg_) Source: http://sadmoment.com/dog-meets-tree-while-playing-fetch-in-the-park-with-a-frisbee/[/caption] 
  


We will need to reduce memory overhead, and improve the response time of our table view, now that we have all that data.  Ideally, in a table view, we would only load up the data that is actually visible to the user at any given moment.  And 
that is exactly what the utility class 
NSFetchedResultsController provides.  Let's see how that is accomplished in RubyMotion.


First of all, we create an 
NSFetchedResultsController. Since this object requires access to the 
NSManagedObjectContext, which is in our store class, that's where we will put it.


def fetched_results_controller
    fetch_request = NSFetchRequest.alloc.init
    fetch_request.entity = NSEntityDescription.entityForName('FailedBankInfo', inManagedObjectContext:@context)
    sort = NSSortDescriptor.alloc.initWithKey("details.close_date", ascending: false)
    fetch_request.sortDescriptors = [sort]
    fetch_request.fetchBatchSize = 20

    NSFetchedResultsController.alloc.initWithFetchRequest(fetch_request,
                                                managedObjectContext:@context,
                                               sectionNameKeyPath:nil,
                                               cacheName:"Root")
  end


The key to the construction of the 
NSFetchedResultsController is providing a base 
NSFetchRequest.  This request needs to know which entity (a.k.a. model) is being fetched, and also requires an 
NSSortDescriptor so it knows in what order to return the requested objects.  The 
fetchBatchSize simply limits the number of objects returned on any single query to the database.


Now that we can create our 
NSFetchedResultsController, where do we call it?  In this case, we will be creating it in our table view controller's 
viewDidLoad method.


def viewDidLoad
    super
    error_ptr = Pointer.new(:object)
    @fetch_controller = FailedBankStore.shared.fetched_results_controller
    @fetch_controller.delegate = self
    unless @fetch_controller.performFetch(error_ptr)
      raise "Error when fetching banks: #{error_ptr[0].description}"
    end
  end


Here we create the 
NSFetchedResultsController, set it's delegate to be self, and trigger the initial fetch to populate table view.


Next, we need to update the table view, so that it knows to get it's data from the 
NSFetchedResultsController.


def tableView(tableView, numberOfRowsInSection:section)
    @fetch_controller.sections.objectAtIndex(section).numberOfObjects
  end

  def configureCell(cell, atIndexPath:index)
    bank = @fetch_controller.objectAtIndexPath(index)
    cell.textLabel.text = bank.name
    cell.detailTextLabel.text = "#{bank.city}, #{bank.state}"
    return cell
  end

  CellID = 'CellIdentifier'
  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CellID) || UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:CellID)
    configureCell(cell, atIndexPath:indexPath)
  end


These methods translate over from Ray's tutorial pretty much intact, without much change, other than the "rubyization".


I did sort of skip a step back there, so let's not forget about that.  In 
viewDidLoad we set the 
NSFetchedResultsController's delegate to be self.  Now, we have to implement the 
NSFetchedResultsControllerDelegate's signature methods.  Ray simply copied his implementation from an Apple sample.  And I've simply converted his code into a Ruby module.


module NSFetchedResultsControllerDelegate

  def controllerWillChangeContent(controller)
    self.tableView.beginUpdates
  end

  def controller(controller, didChangeObject:object, atIndexPath:path, forChangeType:type, newIndexPath:new_path)
    tableView = self.tableView
    case type
      when NSFetchedResultsChangeInsert
        tableView.insertRowsAtIndexPaths([new_path], withRowAnimation:UITableViewRowAnimationFade)
      when NSFetchedResultsChangeDelete
        tableView.deleteRowsAtIndexPaths([path], withRowAnimation:UITableViewRowAnimationFade)
      when NSFetchedResultsChangeUpdate
        configureCell(tableView.cellForRowAtIndexPath(path), atIndexPath:path)
      when NSFetchedResultsChangeMove
        tableView.deleteRowsAtIndexPaths([path], withRowAnimation:UITableViewRowAnimationFade)
        tableView.insertRowsAtIndexPaths([new_path], withRowAnimation:UITableViewRowAnimationFade)
    end
  end

  def controller(controller, sectionIndexTitleForSectionName:sectionName)
  end

  def controller(controller, didChangeSection:section, atIndex:index, forChangeType:type)
    case type
      when NSFetchedResultsChangeInsert
        self.tableView.insertSections( NSIndexSet.indexSetWithIndex(index), withRowAnimation:UITableViewRowAnimationFade)
      when NSFetchedResultsChangeDelete
        self.tableView.deleteSections( NSIndexSet.indexSetWithIndex(index), withRowAnimation:UITableViewRowAnimationFade)
    end
  end

  def controllerDidChangeContent(controller)
    self.tableView.endUpdates
  end
end


Then we must include that module in our table view controller, to satisfy the requirements of the delegate:


class FailedBankTableViewController < UITableViewController
  include NSFetchedResultsControllerDelegate


It looks like a lot of code, but if you only need to display data, and you don't need to change it much, you should just be able to reuse this module when required.


And that, as they say, is that.  We now have a working implementation of 
NSFetchedResultsController, and the data will only be loaded 20 objects at a time.  This speeds things up immensely, and reduces memory usage in our app from get-killed-immediately to just fine ;-)  The complete 
[example](https://github.com/wndxlori/WNDXRubyMotion/tree/nsfetchedresultscontroller/FailedBankCD) can be downloaded and run.  Alas, I am unable to provide the "large data load" that I used, as that data is not mine to give away.  I encourage you to come up with your own large data set, and plug it in, and see how it works.


What's next after this?  Since one of the strengths of Ruby (and thus RubyMotion) is it's rich eco-system of gems, we should take all a look at what is available for use with Core Data.


Until then…


If you found this post enlightening, you will find the ebook I wrote on these topics (and more) will allow you to spend more time working on your iOS application features, instead of fighting with Core Data for hours (or days).
