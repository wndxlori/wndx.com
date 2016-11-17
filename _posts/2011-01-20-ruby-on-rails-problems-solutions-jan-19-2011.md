---
layout: post
title: Ruby on Rails problems & solutions - Jan 19, 2011
categories: 
- web development
tags: []
status: publish
type: post
published: true
meta: {}
---

**HTTP auth - this way lies madness**
 
 

I'm certain that others will follow this path, so this is posted as a WARNING. Do NOT try to mix and match HTTP auth with any other form of authentication in your Rails application.

My problem was this... we wanted to have Users and Administrators, but we didn't want the two to mix. So, Users are all happy and nice with authlogic. We didn't have time to implement a full authorization solution, so... 
My solution was a quick & dirty HTTP auth applied to scaffolded admin pages. Seems like an simple enough solution, and it solves the problems nicely, where Users don't have the admin password, and Admins can't log in to the app and see private data. 
 

The problems all came later, on the development side. Multiple developers just about ripped themselves bald trying to track down mysterious errors that seemed to prevent user authorization... You see, once someone has used the HTTP auth, it replaced the authlogic user in the session, and THERE'S NO WAY TO LOG OUT OF IT WITHOUT SHUTTING DOWN THE BROWSER.

  
[http://www.google.ca/search?q=clear+http+authentication&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:en-US:official&client=firefox-a](http://www.google.ca/search?q=clear+http+authentication&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:en-US:official&client=firefox-a) 
 

So, quick & dirty turned into hours lost, debugging non-existent issues. If you are going to use HTTP auth... well, don't.

**Need an "official" PDF icon?**Simple, but what the heck.  We needed to download PDF files from our app.  There's lots of logos out there, but the official Adobe icons can be found here:[http://www.adobe.com/misc/linking.html](http://www.adobe.com/misc/linking.html)

**Traversing up the DOM - parents**



Again, we are back to a jQuery/Ajax issue.  Clicking on an item (icon, see above) in a table row, we needed to get the associated job id.  As in -  I have a click function on an image, and I want to walk up the DOM from the image, to the parent row (tr), in order to find the 'id' of the item in question. 



If you look for "parent" you'll find a lot of stuff that doesn't actually work.  What you probably want, is "closest". 



[http://api.jquery.com/closest/](http://api.jquery.com/closest/)
