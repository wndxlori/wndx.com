---
layout: post
title: Ruby on Rails problems & solutions - Apr 12, 2011
categories: []
tags: []
status: publish
type: post
published: true
meta: {}
---

Why does my remote form only work the first time?

Protip - don't do this:
$('#some_div input').val("");

in your Javascsript response to a remote form in Rails.  You'll spend entirely too much time wondering why the form only works once, then you get routing errors. (Hint: it clears the hidden :method field.  D'Oh!)

Protip for Github/Capistrano users



Ok, you deploy n00bs - really, really, read the stuff on Github about using Capistrano.  



[http://help.github.com/capistrano/](http://help.github.com/capistrano/)



And, even if you don't understand what it does, use this option in your deploy.rb:

default_run_options[:pty] = true  #Must be set for the password prompt from git to work!!!!!



Emphasis ! added. I went round-and-round with our sysadmin/deploy guy for far too long, before discovering he didn't add this line, because he didn't understand what it did.  


Image Maps
I've used other people's image maps before, but I never built one from scratch myself.  Look out for these Firefox gotchas:


[http://forums.techguy.org/web-design-development/580707-image-map-doesnt-work-firefox.html](http://forums.techguy.org/web-design-development/580707-image-map-doesnt-work-firefox.html)
[http://www.boutell.com/newfaq/creating/border.html](http://www.boutell.com/newfaq/creating/border.html)
