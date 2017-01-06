---
layout: post
title: Ruby on Rails problems & solutions - Jan 26, 2011
categories: 
- web development
tags: []
status: publish
published: true
meta: {}
---

RSpec'ing your rescue_from

You might remember from the previous post, we started using rescue_from in our Ajax actions.  Now, how the heck do you test those suckers?

[http://stackoverflow.com/questions/4466399/rspec-testing-rescue-from](http://stackoverflow.com/questions/4466399/rspec-testing-rescue-from)

SQLite database reloading



In development, it is not uncommon to want to "start over" in your development database, but... not completely.  Sometimes, you have useful data, and you don't want to blow it all away.  Here is a handy set of rake tasks to reset/reload your SQLite database:

[http://alexcline.net/2010/04/06/reloading-sqlite-data-in-rails/](http://alexcline.net/2010/04/06/reloading-sqlite-data-in-rails/)

jQuery.globalEval instead of eval

I was having problems with Javascript "eval".  "Missing ( in parenthetical" was the error.  Grrrrrr.  After much Googling and many failures, I finally got around it by using globalEval instead:

[http://api.jquery.com/jQuery.globalEval/](http://api.jquery.com/jQuery.globalEval/)
