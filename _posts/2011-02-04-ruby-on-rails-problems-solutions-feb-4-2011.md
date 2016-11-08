---
layout: post
title: Ruby on Rails problems & solutions - Feb 4, 2011
categories: []
tags: []
status: publish
type: post
published: true
meta: {}
---

RSpec and weird error on stub and raise InvalidRecord

I was baffled by this error, when I was trying to test my "rescue_from" code, on some validation errors.  I kept getting:

wrong number of arguments (0 for 1)

Here's the guy who asked the right question:

Q: 
[http://www.mail-archive.com/rspec-users@rubyforge.org/msg00975.html](http://www.mail-archive.com/rspec-users@rubyforge.org/msg00975.html)



And here's the answer.  Seems obvious in retrospect, sigh.

A: 
[http://www.mail-archive.com/rspec-users@rubyforge.org/msg00978.html](http://www.mail-archive.com/rspec-users@rubyforge.org/msg00978.html)



Roles and Authorization, With authlogic



Was doing a lot of work with roles in the Rails 3 project, where we already used authlogic.



This is a nice little add-on, with really basic stuff:

[https://github.com/platform45/easy_roles](https://github.com/platform45/easy_roles)



However if you need industrial-strength roles, and we did, then you'll probably want to go with acl9

[https://github.com/be9/acl9](https://github.com/be9/acl9)



Note that acl9 is not for the faint of heart.  The examples were ... not really relevant to what I needed to do, so I kind of had to figure it out on my own.

Foreign key gem



I stumbled across this gem, in the search for something completely different:

[https://github.com/matthuhiggins/foreigner](https://github.com/matthuhiggins/foreigner)

It certainly looks good, but I haven't had a chance to try it out, yet. If you have, please comment!
