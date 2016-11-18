---
layout: core-data-book
title: Core Data Relationships in RubyMotion
categories:
- products
tags:
- core data
- rubymotion
- mobile development
- ruby
- ios
status: publish
type: post
published: true
meta:
  _thumbnail_id: '136'
---

Updated June 12, 2015


So, we've been talking about using Core Data in RubyMotion.  If you missed my earlier posts, you can find them here:


*[Introduction to Core Data in Motion](/blog/core-data-in-motion)


*[Core Data Basics in RubyMotion](/blog/core-data-basics-in-rubymotion)


Today, let's dig into a more meaty problem.  Relationships between entities in Core Data.  If you google for that, you will undoubtedly end up at Ray Wenderlich's site, and his 
[Core Data Tutorial fo iOS: Getting Started](http://www.raywenderlich.com/934/core-data-tutorial-for-ios-getting-started).  Which, BTW, is an awesome tutorial that describes exactly how to set up relationships between entities in Core Data… in the Visual Model editor in Xcode.


Right, but we aren't using Xcode (you can, but it's probably not worth the extra effort of duplicating all your data models in Obj-C).  We are using RubyMotion, and we want to define our models 
in code.  Thankfully, it's not as difficult as it might seem at first blush.  Since I was inspired (and informed), by Ray's tutorial, I have created a RubyMotion project to illustrate this based on his "Failed Banks" example.  You can find my project 
[here](https://github.com/wndxlori/WNDXRubyMotion/tree/master/FailedBankCD).


In the 
[basics](/blog/core-data-basics-in-rubymotion) post we already created Core Data managed objects, defined their attributes, and dealt with the persistent store coordinator, managed object context, and the managed object model.  So let's just assume you have all that, and get right down to… two models, how to connect them together.


I was interested to discover that a relationship is simply another property, much like an entity attribute.  So, when the entities properties are assigned, you just add the relationships to that array along with the attributes.  Seems simple enough.


![It's a trap](http://i0.kym-cdn.com/photos/images/original/000/001/384/Atrapitis.gif){: .img-responsive .center-block}


Unfortunately, it's not that simple after all.  In order for two Core Data entities to be connected, each needs to have a relationship defined to the other.  The problem here being the old chicken-and-egg.  When you define the first entity, the second does not exist, and so the 
NSRelationshipDescription cannot be fully specified.  Argh.


But here's the trick.  You CAN create an entity, and add it to the managed object model, WITHOUT specifying any properties (attributes OR relationships) on it. Then we have a nice handy store of all the entities, pre-defined, and can proceed to lazily specify the relationships.  Let's see what that looks like.


First, I have re-factored my 
[models](https://github.com/wndxlori/WNDXRubyMotion/blob/master/FailedBankCD/app/models/failed_bank_info.rb), so that the entity creation does not add attributes at the same time.

```ruby
def self.entity
    @entity ||= begin
      # Create the entity for our managed object class
      entity = NSEntityDescription.alloc.init
      entity.name = name
      entity.managedObjectClassName = name
      entity
    end
  end
```

As you can see here, this code is looking pretty non-specific to the model, and can easily be factored out.  In fact, that's where most of the RubyMotion specific modelling gems that support Core Data start.  I'll leave that as an exercise for you.


Next we have separate definitions for the attributes:

```ruby
def self.attributes
    @attributes ||= [
      {:name => 'name', :type => NSStringAttributeType, :default => nil, :optional => false},
      {:name => 'city', :type => NSStringAttributeType, :default => nil, :optional => false},
      {:name => 'state', :type => NSStringAttributeType, :default => nil, :optional => false},
    ]
  end
```

and the relationships:

```ruby
def self.relationships
    @relationships ||= [
      {
        :name => 'details', 
        :destination => 'FailedBankDetails', 
        :inverse => 'info', 
        :optional => true, :transient => false, :indexed => false, :ordered => true, 
        :min => 1, :max => 1, :del => NSCascadeDeleteRule
      },
    ]
  end
```

We have similar atrributes and relationship defined on the 
[FailedBankDetails](https://github.com/wndxlori/WNDXRubyMotion/blob/master/FailedBankCD/app/models/failed_bank_details.rb) entity, which is the inverse of this relationship.


Ok, now that we have entities, attributes, and relationships specified, let's jump over to our 
[store](https://github.com/wndxlori/WNDXRubyMotion/blob/master/FailedBankCD/app/models/failed_bank_store.rb) object, where we create the 
`NSManagedObjectModel`:

```ruby
    model ||= NSManagedObjectModel.alloc.init.tap do |m|
      m.entities = [FailedBankInfo, FailedBankDetails].collect {|c| c.entity}
      m.entities.each {|entity| set_entity_properties(entity,m)}
    end
```

Here we have added all the entities in our data model (all two of them) to the MOM.  Once those entities exist, they can be used to complete the creation of the relationships.

```ruby
def set_entity_properties(entity, model)
    # set up attributes
    managed_object_class = Object.const_get(entity.managedObjectClassName)
    entities = model.entitiesByName

    attributes = managed_object_class.attributes.collect do |attr|
      property = NSAttributeDescription.alloc.init
      property.name = attr[:name]
      property.attributeType = attr[:type]
      property.defaultValue = attr[:default]
      property.optional = attr[:optional]
      property
    end
    # set up relationships
    relationships = managed_object_class.relationships.map do |rel|
      relation = NSRelationshipDescription.alloc.init
      relation.name = rel[:name]
      relation.destinationEntity = entities[rel[:destination]]
      relation.inverseRelationship = entities[rel[:inverse]]
      relation.optional = rel[:optional] || false
      relation.transient = rel[:transient] || false
      relation.indexed = rel[:indexed] || false
      relation.ordered = rel[:ordered] || false
      relation.minCount = rel[:min] || 1
      relation.maxCount = rel[:max] || 1 # NSIntegerMax
      relation.deleteRule = rel[:del] || NSNullifyDeleteRule # NSNoActionDeleteRule NSNullifyDeleteRule NSCascadeDeleteRule
      relation
    end
    # assign properties
    entity.properties = attributes + relationships
  end
```

And voila!  We have a fully specified data model, with relationships and inverse relationships.


![Voila!](/img/original/voila.gif){: .img-responsive .center-block} 


The complete 
[example](https://github.com/wndxlori/WNDXRubyMotion/tree/master/FailedBankCD) can be downloaded and run. It's not actually that exciting without any data loaded.  I'm sure you won't be too surprised to discover that is the next topic that we will be covering.


Until then…


If you found this post enlightening, you will find the ebook I wrote on these topics (and more) will save you hours, if not days, of research and frustration.
