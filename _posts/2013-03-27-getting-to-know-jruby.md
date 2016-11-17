---
layout: post
title: Getting to know JRuby
categories: 
- software craft
tags:
- jruby
- rails
- ruby
- deploy
status: publish
type: post
published: true
meta: {}
---

As a former Java programmer (of over 8 yrs), it has been slightly embarrassing for me, as a current Ruby programmer (of over 7 yrs) to have never had an opportunity to use JRuby in a Ruby project.  I keep running into Charles Nutter at conferences, and saying "maybe next year" for far too long.

But last month, I finally got my chance.  New contract, new project, and JRuby seemed like the right choice.  Finally. Having run thru the JRuby book many moons ago,  to get brushed up with JRuby, I decided I'd haul out that "Deploying JRuby" book that I bought last year in one of my "hey, coupon!" book buying binges.

As I proceeded through the book, I discovered a problem that my coding partner had already discovered.  The example program, on which the entire book is based, no longer works, at all, because the gem version of the Twitter gem it was based upon was completely yanked by Twitter.  BTW, thanks, Twitter, for giving me yet another reason to prefer App.net.

Now, this might make things a little more difficult, but let's face it.  You aren't building a Twitter client, so using that example program is just a crutch, it's NOT necessary.  You probably have a project in mind already.  Fine, go create a jruby branch and get going.  Or you haven't started yet.  That's fine too.  You probably have a good idea of the kind of project, and which combination of gems you wanted to use.  So go find a nice example on Github, fork it, and get going.  That's what I did.  I grabbed the rails-bootstrap-device-cancan project, and started working.  I've learned a lot, too.

In the coming days, I'll be posting again, reviewing my progress on the project I chose, and the problems I ran into, and show you the solutions I discovered.  It's been a lot of fun.
