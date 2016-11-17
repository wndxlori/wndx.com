---
layout: post
title: Core Data in Motion - Chapter 2
categories: 
- products
tags: []
status: publish
type: post
published: true
meta: {}
---

So, Core Data and relationships.  Lots of iOS apps are small, so why wouldn't you just smoosh all your data into one big model?


Performance. Memory. Speed.


With Core Data, you cannot simply retrieve only certain attributes from a object.  For instance, in my WIMBY application, we have a rather huge monolithic well table, with about 20 attributes for each well.  When we want to display these on a map, we only need 4 of those 20 attributes.  A unique identifier,  "label" for the pin, and the latitude and longitude values for map coordinates.  To be memory/bandwidth efficient, we would only select the 4 attributes we actually need when retrieving the data from the database.  In Rails ActiveRecord parlance, that would be something like:


Well.select(:uwi, :well_name, :surface_latitude, :surface_longitude)


In this 
Well.select statement, we have only 4 attributes out of our original 20. This saves us approximately 80% of the memory/bandwidth of a full record retrieval, which most programmers would think was a Good Thing™.  The only problem here is, we can't do that in Core Data.


WAT?


Yup, in Core Data, fetches will return either object ID's 
**only**
 or whole objects 
**only**
.  There is no way to refine that fetch with a select clause, like we have in SQL or ORM tools like ActiveRecord.


In our particular case of the well table, Core Data will either fetch entire objects, chewing up 5x the amount of memory that we actually need, or fetch only object ID's, and then lazily fetch each object as it is accessed.  In case you haven't run into THIS particular problem before, it's called the 
[N+1 Query](http://lmgtfy.com/?q=n%2B1+query) problem, and it will have a significant effect on the speed of your application. Your choice here is between MOAR MEMORY or MOAR SLOW.


So how do we make make our object fetches more performant in Core Data?


This is accomplished through decomposing our monolithic models into several distinct models with one-to-one relationships between each model (entity).  Each model contains only the information necessary for the view in which it will be used.  In the hot-off-the-presses Chapter 2 of 
[Core Data in Motion](http://coredatainmotion.com), we examine, in detail, how to accomplish this.
