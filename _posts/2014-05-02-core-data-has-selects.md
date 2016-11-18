---
layout: core-data-book
title: Core Data has selects
categories:
- products
tags:
- ruby
- rubymotion
- core data
status: publish
type: post
published: true
meta: {}
---

After my last post, there was an interesting side discussion on Twitter (with @macfanatic and @kastiglione) about some alternatives.  It was interesting enough that I thought it would make good material for another post.  So here ya go!


So, to revisit the last post 
[Core Data in Motion - Chapter 2](/blog/core-data-in-motion-chapter-2), we discussed the notion that Core Data doesn't really have the notion of a "select" clause.


What is the impact of this limitation?


If you have a large monolithic model, but just wanted a subset of the attributes for your current view, like, say a MAP, you'd probably want to do something similar to the ActiveRecord query:

```ruby
Well.select(:uwi, :well_name, :surface_latitude, :surface_longitude)
```

But you can't do that in Core Data.  When you execute a Core Data fetch, you get the option of getting back object ids 
**only**
 or whole objects 
**only**
.


Or can you?


That was the point under discussion on Twitter.  There is actually another option, but it comes with its own limitations.  So let's take a look at that other option, and see what it gives us, and what it takes away.


If you look at the SDK docs for 
NSFetchRequest, you will see a method called 
setPropertiesToFetch.  The SDK description for this method is:

```
Specifies which properties should be returned by the fetch. The 
property descriptions may represent attributes, one-to-one
relationships, or expressions. The name of an attribute or
relationship description must match the name of a description 
on the fetch request’s entity.

Parameters:
    values (Array) — An array of NSPropertyDescription objects that 
    specify which properties should be returned by the fetch.

Returns:
    (Object)
```

Hey!  So you can get your 
`NSFetchRequest` to return only this specified subset of properties!  Isn't that just like a select?


Well, not quite.  You see, when you run the 
`NSFetchRequest` with the 
`propertiesToFetch` specified, it will still 
**ignore**
 your 
`propertiesToFetch`, unless you have also specified a 
resultType of 
`NSDictionaryResultType`. This is detailed in the answer to this 
[Stack Overflow question](http://stackoverflow.com/questions/7698909/nsfetchrequest-with-distinct-properties).


Then, when you run the 
`NSFetchRequest` with some 
`propertiesToFetch` and a 
`resultType` of 
`NSDictionaryResultType` you get back an array of 
`NSDictionary` items, 
**NOT**
 your 
`NSManagedObjects`.  So your results won't have any of the methods you've declared on those 
`NSManagedObjects`, like, for instance, if you implemented the 
`MKAnnotation` interface so that you can drop those results on an 
`MKMapView` (which was my particular issue with this).


I will further note that the 
[Stack Overflow post](http://stackoverflow.com/questions/7698909/nsfetchrequest-with-distinct-properties) also indicates that the 
`NSFetchedResultsController` doesn't play nicely with 
`NSDictionaryResultsType`, which would limit it's usefulness with most standard 
`UITableViewControllers` implementations, too.


So... I can't use these results on my map, and it won't play nicely with my list view, either. I'm sure it's useful in some use cases, but its limitations made it useless for both of mine, so this is where 
`NSFetchRequest.propertiesToFetch` and I parted company.
