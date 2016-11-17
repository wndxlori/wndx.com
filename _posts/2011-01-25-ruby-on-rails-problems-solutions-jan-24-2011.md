---
layout: post
title: Ruby on Rails problems & solutions - Jan 24, 2011
categories: 
- web development
tags: []
status: publish
type: post
published: true
meta: {}
---

Date Formats for Rails 3
It's surprisingly difficult to find up-to-date, comprehensive info about date formats and time zones for Rails. It's been a moving target, updated in every release.  This thread pops up a lot:

[http://www.ruby-forum.com/topic/57923](http://www.ruby-forum.com/topic/57923)



It's mostly out of date, but it's worth a read, just for the variety of interesting solutions.  This article is more recent, and provides comprehensive examples:



[http://mad.ly/2008/04/09/rails-21-time-zone-support-an-overview/](http://mad.ly/2008/04/09/rails-21-time-zone-support-an-overview/)

Also, there's some good information here:



[http://www.ruby-forum.com/topic/890711](http://www.ruby-forum.com/topic/890711)



But, I have to agree, you need a *damn* good reason to store anything other than UTC in your database.  If you have UTC, then you always have a basic starting point.





ActiveRecord "update" is annoying



Why isn't there an update! ?  The only way to tell if there is a problem, is to examine the returned object for validity.  

What to do about 404's in your Ajax app

Of course, you should know about rescue_from already.  If you don't, then get to it.  It's interesting and useful.

[http://www.simonecarletti.com/blog/2009/12/inside-ruby-on-rails-rescuable-and-rescue_from/](http://www.simonecarletti.com/blog/2009/12/inside-ruby-on-rails-rescuable-and-rescue_from/)



But, it's only useful, if you can use it for all your server-side needs, including your Ajax calls:

[http://railsforum.com/viewtopic.php?id=29983](http://railsforum.com/viewtopic.php?id=29983)
