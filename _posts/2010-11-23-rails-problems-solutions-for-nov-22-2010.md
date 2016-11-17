---
layout: post
title: Rails Problems & solutions for Nov 22, 2010
categories: 
- web development
tags: []
status: publish
type: post
published: true
meta: {}
---

will-paginate, ajax, and Rails 2.1

First up.  I was suddenly faced with the need to display a kind of master-detail kind of data.  But only one "master" record needed to be visible at a time.  Perfect, I thought, I can use will-paginate to flip thru the master records, with a :per_page => 1.  But... this data is embedded in a page with reams of other data, and I don't want to re-display the whole thing, just to page thru my master records.  Ok, that should be simple enough, I just need to make the will-paginate links :remote, and only update the div with my master-detail data.


After searching for "will-paginate and ajax" and "will-paginate and remote", I eventually found:



[http://weblog.redlinesoftware.com/2008/1/30/willpaginate-and-remote-links](http://weblog.redlinesoftware.com/2008/1/30/willpaginate-and-remote-links)



This is a great posting.  Too bad it didn't work for me.  But I persevered, and read down thru all the comments, and finally, at comment #23, I found my solution.  This particular project is stuck back on Rails 2.1.  The original posting was updated for Rails 2.3.  But 
Kiran Achyutunikindly posted his, revised, solution for Rails 2.1.  I plugged it in, and it worked.



Mocking Associations



In the course of writing specs for the above solution, I was trying to mock out the result of the WillPaginate.paginate call.  Although associations are not directly related to paginate, paginate acts enough like an association that I followed a link to this posting, and it provided the hints I needed:



[http://blog.elctech.com/2008/11/18/rspec-mocking-association-collections/](http://blog.elctech.com/2008/11/18/rspec-mocking-association-collections/)



Ajax radio buttons



In addition to the "paging" of my master-detail data, I also discovered the need to filter the master records in two different ways.  Since ajaxifying the paging links worked so well, I decided that would work with my 2 new radio buttons as well.



Again, this is a Rails 2.1 app, so I'm sticking with the older conventions, and this page provided easy examples of what I wanted to do:



[http://martijnlafeber.blogspot.com/2008/06/rails-radio-button-with-remote-function.html](http://martijnlafeber.blogspot.com/2008/06/rails-radio-button-with-remote-function.html)



Just remember that, in your new Rails 2.3 or 3.0 apps, you should always be using Unobtrusive JavaScript.



That's it for today.
