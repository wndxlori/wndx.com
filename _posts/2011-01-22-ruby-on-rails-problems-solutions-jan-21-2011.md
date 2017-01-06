---
layout: post
title: Ruby on Rails problems & solutions - Jan 21, 2011
categories: 
- web development
tags: []
status: publish
published: true
meta: {}
---

Routes and formats
For some reason, I got stuck on this.  It's not explicitly stated anywhere in the new routing documenation/guides, but if you need a format, it's a parameter for your path:
workbook_job_path(job, :format => 'pdf')


I actually had to go look at source code to find that. :-p

Whitespace stripping your form params
You can get into a lot of interesting situations, if you don't pay attention to details like this, in your Rails app.  Quite a few solution variations, some of which actually work:


[http://railsforum.com/viewtopic.php?id=969](http://railsforum.com/viewtopic.php?id=969)

View Git file history
Once again, fun with git.  I think I need a better Git client (currently using GitX).  Found my answer here:



[http://stackoverflow.com/questions/278192/git-how-do-i-view-the-change-history-of-a-file](http://stackoverflow.com/questions/278192/git-how-do-i-view-the-change-history-of-a-file)

The solution:



git log -p filename
