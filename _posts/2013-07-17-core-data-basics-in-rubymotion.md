---
layout: post
title: Core Data Basics in RubyMotion
categories:
- RubyMotion
- Core Data
tags:
- rails
- ruby
- RubyMotion
- Core Data
status: publish
type: post
published: true
meta: {}
---

Updated June 12, 2015.


I always approach posts like this one with a fear that it's "too basic" or "too easy" and no one will find value in it. Then I find myself looking for good solid introductory information on topics unfamiliar to me, and discover that good intro posts are hard to find. So here goes.


If you want to use Core Data in your RubyMotion project, then you should probably start with the 
[RubyMotionSamples](https://github.com/HipByte/RubyMotionSamples) project on Github. Although most of the samples are pretty basic, they all have valuable lessons to teach us. With the recent addition of OSX application support in RubyMotion, the samples have been subdivided into ios and osx subdirectories. The sample project you will want is under ios, and is called "Locations".
  
       [caption id="" align="alignnone" width="149.0"]
[![RubyMotion Samples](/squarespace_images/static_50d2902fe4b0959a0871a12c_50d29312e4b04687d9db341b_5571d3cbe4b0d635f261b537_1433523148015__img.png)](http://rubymotion.com) RubyMotion Samples[/caption] 
  


The user interface on Locations consists of a fairly basic 
UITableViewController, so we won't spend much time there. The interesting stuff is all found in the other 2 files. We have location.rb and locations_store.rb.


The Location model in 
[location.rb](https://github.com/HipByte/RubyMotionSamples/blob/master/ios/Locations/app/location.rb#L1) starts off by subclassing 
NSManagedObject. This is the basic model type of Core Data.


class Location < NSManagedObject
end


Now if you were using Xcode, you'd be defining your models in a xcdatamodel file, using the fancy graphical designer. But we aren't using Xcode, so how is that done in code?


Fortunately, it's not that difficult. We simply need to create and populate an 
[NSEntityDescription](https://github.com/HipByte/RubyMotionSamples/blob/master/ios/Locations/app/location.rb#L5)


def self.entity
    @entity ||= begin
      entity = NSEntityDescription.alloc.init
      entity.name = 'Location'
      entity.managedObjectClassName = 'Location'
      entity.properties = 
        ['creation_date', NSDateAttributeType,
         'latitude', NSDoubleAttributeType,
         'longitude', NSDoubleAttributeType].each_slice(2).map do |name, type|
            property = NSAttributeDescription.alloc.init
            property.name = name
            property.attributeType = type
            property.optional = false
            property
          end          
      entity
    end
  end


This code creates (and caches) the entity (which represents a database table), and adds properties (the table's columns) to it. Pretty simple.


I would suggest, if you are going to be writing code like this, that you invest in 
[Dash](https://github.com/HipByte/RubyMotionSamples/blob/master/ios/Locations/app/location.rb#L5) sooner rather than later, because it will make answering questions like "What other 
NSAttributeType's are available?" so much easier.
  
      
[![](/squarespace_images/static_50d2902fe4b0959a0871a12c_50d29312e4b04687d9db341b_5571d61de4b019f4b6c477b3_1433523742623__img.png)](https://kapeli.com/dash)
  


The 
[iOS Programming: The Big Nerd Ranch Guide](http://www.amazon.ca/gp/product/0321942051/ref=as_li_ss_tl?ie=UTF8&camp=15121&creative=390961&creativeASIN=0321942051&linkCode=as2&tag=twg0f-20) book describes the 
[Model-View-Controller-Store](http://my.safaribooksonline.com/book/programming/mobile/9780132978767/28dot-model-view-controller-store/idp9443648) or MVCS pattern, which introduces the Store object. Turns out this is a really useful pattern when dealing with external sources of data, like Core Data, and that's what our Locations sample is doing with 
[locations_store.rb](http://kapeli.com/dash).


class LocationsStore
  def self.shared
    # Our store is a singleton object.
    Dispatch.once { @instance ||= new }
    @instance
  end
end


Our store follows the Singleton pattern. In order to ensure that we only ever have one store object, the 
[initialize](https://github.com/HipByte/RubyMotionSamples/blob/master/ios/Locations/app/locations_store.rb#L38) method is declared private,


private

  def initialize
    model = NSManagedObjectModel.alloc.init
    model.entities = [Location.entity]

    store = NSPersistentStoreCoordinator.alloc.initWithManagedObjectModel(model)
    store_url = NSURL.fileURLWithPath(File.join(NSHomeDirectory(), 'Documents', 'Locations.sqlite'))
    error_ptr = Pointer.new(:object)
    unless store.addPersistentStoreWithType(NSSQLiteStoreType, configuration:nil, URL:store_url, options:nil, error:error_ptr)
      raise "Can't add persistent SQLite store: #{error_ptr[5].description}"
    end

    context = NSManagedObjectContext.alloc.init
    context.persistentStoreCoordinator = store
    @context = context
  end


There's a lot going on here, so let's take it one step at a time. First, we need to create our 
NSManagedObjectModel (MOM), and tell it about the entities we are going to be storing.


model = NSManagedObjectModel.alloc.init
model.entities = [Location.entity]


Next, we create an 
NSPersistentStoreCoordinator (PSC), initializing it with our MOM.


store = NSPersistentStoreCoordinator.alloc.initWithManagedObjectModel(model)


Then we define the location of our Core Data store, which in this case is a sqlite database.


store_url = NSURL.fileURLWithPath(File.join(NSHomeDirectory(), 'Documents', 'Locations.sqlite'))


Now we tell the PSC where to keep our locations.


error_ptr = Pointer.new(:object)
unless store.addPersistentStoreWithType(NSSQLiteStoreType, configuration:nil, URL:store_url, options:nil, error:error_ptr)
  raise "Can't add persistent SQLite store: #{error_ptr[5].description}"
end


Lastly, we create the 
NSManagedObjectContext (MOC), which we will be using to access our store as data is added, removed, and fetched.


context = NSManagedObjectContext.alloc.init
context.persistentStoreCoordinator = store
@context = context


I will point out here, that if you were programming this in Objective C, all the code from this initialize method would still need to be written, with the exception of about one line.


The code to add and remove Locations is fairly trivial, so I will leave it as an exercise to the reader. I do, however, want to help decipher one last bit of code. The 
[NSFetchRequest](https://github.com/HipByte/RubyMotionSamples/blob/master/ios/Locations/app/locations_store.rb#L11) which is used to pull data back out of our Core Data store.


def locations
    @locations ||= begin
      # Fetch all locations from the model, sorting by the creation date.
      request = NSFetchRequest.alloc.init
      request.entity = NSEntityDescription.entityForName('Location', inManagedObjectContext:@context)
      request.sortDescriptors = [NSSortDescriptor.alloc.initWithKey('creation_date', ascending:false)] 

      error_ptr = Pointer.new(:object)
      data = @context.executeFetchRequest(request, error:error_ptr)
      if data == nil
        raise "Error when fetching data: #{error_ptr[5].description}"
      end
      data
    end
  end


The 
NSFetchRequest is created, and we tell it what entity we are looking for by pulling it out of our MOC by name. Then we define the sort order of our query. Finally, we ask the context to execute the query, and it should return all our Locations, sorted by 
creation_date.


I hope this has demystified the basics of using Core Data in RubyMotion. It's not nearly as difficult as I had imagined when I started.


Next up, we discuss our first complication… How to define 
[multiple, related models](http://www.wndx.com/blog/core-data-relationships-in-rubymotion). Until then…


If you found this post interesting, you will find the ebook I wrote on these topics (and more) will save you hours, if not days, of research and frustration.
