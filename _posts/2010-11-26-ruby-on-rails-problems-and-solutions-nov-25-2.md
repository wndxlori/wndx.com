---
layout: post
title: Ruby on Rails problems & solutions - Nov 25, 2010
categories: 
- web development
tags: []
status: publish
type: post
published: true
meta: {}
---

And, back to the Rails 3 app today.



Adding custom attributes to to_json



When dealing with forms that are submitted remotely, sometimes you need to provide information that you wouldn't otherwise think that hard about.  In this case, we are creating Jobs for Customers.  When you create a Job, it's always for a Customer.  We display the customer_name as an autocomplete field in the form, and have a hidden customer_id field that is updated when you make an autocomplete selection.  Simple.  



But what about after the form submit?  You get back a Job to display in your page, and you want that Customer Name field.  Tough noogies, you only get Job attributes back from to_json.  Or... do you?



This link pointed me in the correct direction:

[http://www.gregbenedict.com/2007/11/28/outputting-custom-model-attributes-with-to_json/](http://www.gregbenedict.com/2007/11/28/outputting-custom-model-attributes-with-to_json/)

The meat of the stuff I needed was here:

[http://apidock.com/rails/ActiveRecord/Serialization/to_json](http://apidock.com/rails/ActiveRecord/Serialization/to_json)



Fixing a bug in the rails3-jquery-autocomplete



This one was fun.  Turns out the little Javascript file that comes with rails3-jquery-autocomplete has a bug in it.  You can specify an id field to be updated, using "id-element" attribute, but it never gets updated, because the jQuery selector syntax was wrong.  Took me a while to find that one.  I forked, fixed, and issued a pull request, so hopefully this will get fixed sooner rather than later.



Creating default values for a Rails model



Lots of bad answers for this one.  But the proper answer (for my particular case) is "after_initialize".  See the comment by insane_dreamer on the supposedly "correct" answer to this question:



[http://stackoverflow.com/questions/1550688/how-do-i-create-a-default-value-for-attributes-in-rails-activerecords-model](http://stackoverflow.com/questions/1550688/how-do-i-create-a-default-value-for-attributes-in-rails-activerecords-model)



validates_associated



This turned into a real bear.  Anyone care to comment on why 



validates_associated :customer, :on => [:create, :save, :update] 



doesn't work, but



validates_associated :customer



does?  The validation never seemed to fail (on bad data) with the first one.  Aren't they the same thing?
