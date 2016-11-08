---
layout: post
title: Ruby on Rails problems & solutions - Dec 2, 2010
categories: []
tags: []
status: publish
type: post
published: true
meta: {}
---

Today seemed to be all about re-discovering stuff that I had done before... but so looooong ago....

 So, how do I... update a single attribute, on multiple ActiveRecords? 

I have a list of jobs. Jobs (multiple) can be selected. And then, you can "move" (change state) on these jobs. So, I wanted a controller action to update a single attribute, on multiple jobs. This seems to do the trick. 
 
[http://snippets.dzone.com/posts/show/7495](http://snippets.dzone.com/posts/show/7495) 
 And how do I do Basic HTTP authentication again? 
 I have used Basic HTTP authentication before, but it was so long ago, that I had completely forgotten how to do it. Nice, simple example: 
 
[http://www.tutorialspoint.com/ruby-on-rails-2.1/rails-http-basic-authenticati...](http://www.tutorialspoint.com/ruby-on-rails-2.1/rails-http-basic-authentication.htm) 
 And how about testing (spec'ing) that? 
 Of course, if you are going to add Basic HTTP Authentication, it has to be tested, right? I've tested it before, but never with RSpec. Interesting that the first several Google'd links produced bad answers. But I persevered, and found one that worked: 
 
[http://railsforum.com/viewtopic.php?id=11669](http://railsforum.com/viewtopic.php?id=11669) 
[http://stackoverflow.com/questions/3768718/rails-rspec-make-tests-to-pass-wit...](http://stackoverflow.com/questions/3768718/rails-rspec-make-tests-to-pass-with-http-basic-authentication) <--- correct
