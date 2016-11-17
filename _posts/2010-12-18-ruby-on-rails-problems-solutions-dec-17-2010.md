---
layout: post
title: Ruby on Rails problems & solutions - Dec 17, 2010
categories: 
- web development
tags: []
status: publish
type: post
published: true
meta: {}
---

send_file and Zero byte files

[http://stackoverflow.com/questions/3724853/rails-sends-0-byte-files-using-send-file](http://stackoverflow.com/questions/3724853/rails-sends-0-byte-files-using-send-file)



Turns out, a default behaviour changed in Rails 3, with 
:x_sendfile now defaulting to true.  This will give you zero byte file downloads in production with send_file.  :-p  So, remember to configure mod_xsendfile on your Apache, or specify 
:x_sendfile as false (not recommended) or use send_data.



Handy Snippet - one liner to dump data to a file



[http://snippets.dzone.com/posts/show/5051](http://snippets.dzone.com/posts/show/5051)



Note.  Don't try to dump a set of ActiveRecords with to_yaml this way.  Doesn't quite work, but I recommend you use 
rails console and try it, just to see why.  It'll be educational.



Dump ActiveRecords to YAML



This is what you need, to dump some ActiveRecords to YAML, assuming you want to do something like what I did, and get some quick and easy fixtures to use in your tests/specs:



[http://snipplr.com/view.php?codeview&id=5970](http://snipplr.com/view.php?codeview&id=5970)



Sorry I didn't have much this week.  We delivered a production release on one project, then spent time nailing down requirement details for the next sprint's stories.  On my Rails 2.x project, I was mostly trawling the warehouse database for new data, and updating the database we use for development, to mimic the warehouse.
