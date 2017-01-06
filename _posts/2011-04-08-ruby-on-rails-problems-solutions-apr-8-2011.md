---
layout: post
title: Ruby on Rails problems & solutions - Apr 8, 2011
categories:
- web development
tags: []
status: publish
published: true
meta: {}
---

RSpec view debugging hackI needed to see what the rendered view looked like, so I could figure out why it was finding "1151" instead of "1" in a tr>td selector.  I knew how to do this in RSpec 1, but not in RSpec 2.

Not a web reference solution to this one, I found it in the RSpec book.  If you are using RSpec, I can't imagine why you wouldn't want to buy this book.

[http://pragprog.com/titles/achbd/the-rspec-book](http://pragprog.com/titles/achbd/the-rspec-book)



The answer is "rendered".  As in:



render

puts rendered.inspect



Not pretty, but it works.  Yes, I know... debugging by println (I'm aging myself with that, aren't I?).  Sometimes the "not pretty" way is the quickest, though.


RSpec'ing with acl9

I was using acl9 (
[https://github.com/be9/acl9](https://github.com/be9/acl9)) in my Rails 3 project.  Now, I have specs for the acl9 functionality, but I started bumping into it on all my controller specs, and I wanted to skip it.  Again, I have this working in my old Rails 2.x app, and RSpec 1.x, this is the new and improved way, with some specific gotchas for acl9:



[http://stackoverflow.com/questions/1772142/rspec-in-rails-how-to-skip-a-before-filter](http://stackoverflow.com/questions/1772142/rspec-in-rails-how-to-skip-a-before-filter)

Password change dialog



Finally got around to implementing that password change story (That's right, suckers, you CAN launch without something that seems really basic).  Sometimes, you find really old stuff:

[http://www.rorexperts.com/viewtopic.php?p=65&sid=56dd051cbb088821acc466aef9e986ec](http://www.rorexperts.com/viewtopic.php?p=65&sid=56dd051cbb088821acc466aef9e986ec)



Take the old stuff with a grain of salt, because it may be total junk.  OTOH, it may still be the definitive answer.  But I kept looking, and found this:

[http://www.justinbritten.com/work/2008/03/how-to-change-or-reset-your-password-with-restful_authentication/](http://www.justinbritten.com/work/2008/03/how-to-change-or-reset-your-password-with-restful_authentication/)



which I liked a lot better, from a purist, RESTful point of view.  However, since I am using authlogic, it couldn't be that simple, could it?  So...


Rechecking password with Authlogic
[http://groups.google.com/group/rubyonrails-talk/browse_thread/thread/3ceee45a38fa59fc](http://groups.google.com/group/rubyonrails-talk/browse_thread/thread/3ceee45a38fa59fc)

Relevant code bit:



@current_user.valid_password? params[:old_password]
----



Like what you've been reading?  Live in Western Canada (or there abouts)?  Sign up at 
[http://ror4real.com](http://ror4real.com), to stay informed about the next upcoming Ruby on Rails for Rail training class, held in Calgary, AB.
