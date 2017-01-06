---
layout: post
title: Ruby on Rails problems & solutions - Nov 30, 2010
categories: 
- web development
tags: []
status: publish
published: true
meta: {}
---

RailsEnv vs RackEnv



When you are switching from Rails 2 to Rails 3, or even if you are deploying your first Rails app at all, you will certainly be lead astray by the endless talk about RailsEnv.  If you are deploying a Rails 3 app with Passenger, and maybe even if you are deploying a Rails 2.3 app, then you want to be using RackEnv.  As long as it has a 'config.ru' file.  Don't get bitten by this one.  At least, not more than once.



[http://cakebaker.42dh.com/2010/01/17/rails-3-and-passenger/](http://cakebaker.42dh.com/2010/01/17/rails-3-and-passenger/)



OpenStruct to the rescue



Have you ever wanted an object to behave like an ActiveRecord, without all the overhead?  Discover OpenStruct, part of the Ruby core. 



[http://ruby-doc.org/core/classes/OpenStruct.html](http://ruby-doc.org/core/classes/OpenStruct.html)



(I post this one because too many people leap into Rails, without first really learning Ruby.  This is one of the little gems you missed.  Enjoy.)



Order by nulls last in sqlite3



I was trying to figure out how to do ORDER BY COL_X NULLS LAST, which seems straightforward enough, but apparently not for Sqlite.  This page has the solution:



[http://www.mail-archive.com/sqlite-users@sqlite.org/msg42004.html](http://www.mail-archive.com/sqlite-users@sqlite.org/msg42004.html)

Of course, sigh, the logic is reversed.  Should be - then 1 else 0



That's it for today.  Two releases, on two separate projects going out the door.  I do remain a little surprised at how easy it is to come up with the material for these posts.  
