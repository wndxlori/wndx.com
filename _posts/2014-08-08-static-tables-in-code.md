---
layout: post
title: Static Tables in Code
categories:
- products
tags:
- ruby
- RubyMotion
- Core Data
- uitableviewcontroller
status: publish
type: post
published: true
meta: {}
---

While there are a lot of great gems and tools to help us with creating great looking user interfaces in code in RubyMotion, sometimes I still like to explore how to do stuff at the iOS API level without using all the magic.  Especially when just writing the code turns out to be pretty straightforward and elegant all on its own.


Creating a static table in code, to display some detail data in your application is one of these cases.


For my specific example, I have 6 items of information about a well to display, and this data logically groups into 3 sections of 2 items in each section.  So, we'll set up the table view using sections like so:


class WellDetailsController < UITableViewController

  SECTIONS = %w(Name Status Location)

  def viewDidLoad
    super
    navigationItem.title = "Well Details"
  end

  def viewWillAppear(animated)
    navigationController.setNavigationBarHidden(false, animated:true)
  end

  def numberOfSectionsInTableView(tableView)
    SECTIONS.size
  end

  def tableView(tableView, numberOfRowsInSection:section)
    2
  end

  def tableView(tableView, titleForHeaderInSection:section)
    SECTIONS[section]
  end


With this code, I have set up my 3 sections (Name, Status, and Location) as a constant array.  Then we implement the necessary methods of the table view (
numberOfSectionsInTableView, 
tableView:numberOfRowsInSection, and 
tableView:titleForHeaderInSection) to deal with these sections.


Next up, we need to fill the actual table cells with data:


CellID = self.class.name

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CellID) || begin
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleValue2,
                                                 reuseIdentifier:CellID)
    end
    cell.textLabel.text = @details[indexPath.section][indexPath.row][:label]
    cell.detailTextLabel.text = @details[indexPath.section][indexPath.row][:value]
    cell
  end

  def showDetailsForWell(well)
    @details = [
      [
        {label: 'UWI', value: well.uwi_display},
        {label: 'Well Name', value: well.well_name},
      ],
      [
        {label: 'Current', value: well.status},
        {label: 'Updated', value: well.status_date.strftime('%Y-%m-%d')},
      ],
      [
        {label: 'Latitude', value: well.latitude.stringValue},
        {label: 'Longitude', value: well.longitude.stringValue},
      ]
    ]
    tableView.reloadData
  end
end


Here, we set up the traditional 
tableView:cellForRowAtIndexPath.  In it, we pull the data for the cell textLabel and detailTextLabel out of our 
@details data structure.  This data structure is an array of arrays.  More specifically, it is an array of sections, and each section array contains an array of rows.  Each row is a hash, with a label/value pair.


The @details data structure itself gets populated with new values (the labels don't change) when a well is selected in another view (from a list of wells, or a map of wells).  The 
showDetailsForWell gets called, and then this view is displayed.


That's all folks.


Certainly, it would be far simpler to code this up using 
[Promotion](https://github.com/clearsightstudio/ProMotion), assuming you already knew and used Promotion. But it wasn't necessary to add another gem to my project for this.  And I now understand exactly how sections and rows work in 
UITableViewController, so it wasn't a total loss ;-)


If you liked this post, you may find the prerelease of my 
[Core Data in Motion](http://book.coredatainmotion.com) book of interest.  Certainly if you plan to use Core Data in your RubyMotion project it will save you many hours of head-scratching. Chapter 4 (Load Optimization) is now available. This will be the last chapter before the book goes up to full price, so get it now, and you will receive the last couple chapters (and maybe some bonus content) as they are completed, at a bargain price.
