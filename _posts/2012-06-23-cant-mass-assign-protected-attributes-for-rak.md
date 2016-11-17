---
layout: post
title: Can't mass-assign protected attributes for rake db:seed
categories: 
- web development
tags: []
status: publish
type: post
published: true
meta: {}
---

So, when you are attempting to seed your database in the latest version of Rails now, you may get:

 
**$ rake db:seed**

**rake aborted!**

**Can't mass-assign protected attributes: blah, blah, blah**
 This, of course, is to save us from the dreaded mass assignment vulnerability. I don't want to turn off that protection in my app, but I do want to do a mass assignment when seeding. I eventually found a solution on the Ruby Forum: 
 
[http://www.ruby-forum.com/topic/1013085](http://www.ruby-forum.com/topic/1013085) 
 but it was out of date, and I got: 
 
**$ rake db:seed**

**rake aborted!**

**Sanitizer is not a module**
 So, I dug into the Rails source, and figured out that the updated version of code that you will need to add to your seeds.rb file is now: 
 
**module ActiveModel**

**  module MassAssignmentSecurity**

**    class Sanitizer**

**      def sanitize(attributes, authorizer)**

**        attributes**

**      end**

**    end**

**  end**

**end**
 Hope this saves others a little of the time I spent when trying to figure this out.
