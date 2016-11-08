---
layout: post
title: Ruby on Rails problems & solutions - May 5, 2011
categories: []
tags: []
status: publish
type: post
published: true
meta: {}
---

Protip for RVM/Capistrano
If you are using RVM/Capistrano, make certain that you sync up your RVM updates on development and your servers, or you might run into this error when you try to deploy:
bash: /usr/local/rvm/bin/rvm-shell: No such file or directory


Solution?  Update RVM on your server, at the same time you update on your dev machines.

Empty xhr on Rails 3 ajax:error
More fun with ajax calls, Rails 3 + jQuery.  If you are baffled by seeing errors like:
error in: undefined
Then you should check out this StackOverflow Q&A for a solution.


[http://stackoverflow.com/questions/3739606/rails3-ajax-callback-has-empty-xhr](http://stackoverflow.com/questions/3739606/rails3-ajax-callback-has-empty-xhr)


No expansion found for :defaults
I encountered this on an upgrade to Rails 3.0.4... (I know, I know, these are getting behind.  But I am starting to catch up)  Anyway, if you upgrade your Rails 3.0.x and then see the dreaded:
No expansion found for :defaults



Then you should read this blog for the solution:


[http://ashenfelter.com/2011/02/09/fix-for-no-expansion-found-for-defaults-error-in-rails-3-0-4/](http://ashenfelter.com/2011/02/09/fix-for-no-expansion-found-for-defaults-error-in-rails-3-0-4/)

Adding a calendar feed to your Rails app



Looks like it's iCalendar, if you are still running on Ruby 1.8.x:

[http://stackoverflow.com/questions/1285492/whats-the-best-icalendar-ics-ical-library-in-ruby](http://stackoverflow.com/questions/1285492/whats-the-best-icalendar-ics-ical-library-in-ruby)



And ri_cal, if you are on Ruby 1.9.x:



[http://loganleger.com/icalendar-webcal-subscription-feed-rails](http://loganleger.com/icalendar-webcal-subscription-feed-rails)
