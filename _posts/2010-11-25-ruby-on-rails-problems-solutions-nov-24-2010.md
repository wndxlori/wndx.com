---
layout: post
title: Ruby on Rails problems & solutions - Nov 24, 2010
categories: []
tags: []
status: publish
type: post
published: true
meta: {}
---

To my friends from the US, may your holiday travels go smoothly, and may the TSA leave your junk alone (
[http://subliminalpanda.blogspot.com/2010/11/tsa-fondling-fat-mens-balls-since-2010.html](http://subliminalpanda.blogspot.com/2010/11/tsa-fondling-fat-mens-balls-since-2010.html))



Meanwhile, back in Canada, where we actually work this week (don't worry, I get the week off at Christmas)...



NetBeans & Subversion & tags



I ran into an interesting bug in NetBeans today, when using Subversion (yep, I'm back to the Rails 2.1 app today, which started out life on svn, and isn't likely to change).



One of my changed files suddenly appeared as belonging to a branch in my Subversion view.  A branch with the same name as the file... Puzzling.  Took me a while to figure it out, but it seems that NetBeans will just treat any old directory with the name "tags", as the tags branch directory.  Oops.  I dropped out to the command line for that commit, and got around the problem that way.



length vs size vs count



I found a place in the code where size and count were being used interchangably on an ActiveRecord has_many association.  That reminded me of a post I read some time ago, that explained the hows and whys of this, so I dug it out again, because it's a great explanation:



[http://rhnh.net/2007/09/26/counting-activerecord-associations-count-size-or-length](http://rhnh.net/2007/09/26/counting-activerecord-associations-count-size-or-length)
