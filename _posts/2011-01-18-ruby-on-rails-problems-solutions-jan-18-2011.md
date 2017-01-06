---
layout: post
title: Ruby on Rails problems & solutions - Jan 18, 2011
categories: 
- web development
tags: []
status: publish
published: true
meta: {}
---

Subscript Ahoy!

This one is simple enough, and I'd done it before, long, long ago.  But I had to look it up that day.  Gotta show chemicals in your HTML page?  Subscript, ahoy!

[http://www.tizag.com/htmlT/htmlsubscript.php](http://www.tizag.com/htmlT/htmlsubscript.php)



Dynamic Table striping



This article:



[http://docs.jquery.com/Tutorials:Zebra_Striping_Made_Easy](http://docs.jquery.com/Tutorials:Zebra_Striping_Made_Easy)



Describes in great detail, how to achieve zebra striping on your tables using jQuery, and even adds a hover-color, which is cool and all, but...



Relevant code:



<script type="text/javascript"> $(document).ready(function(){ $(".stripeMe tr").mouseover(function(){$(this).addClass("over");}).mouseout(function(){$(this).removeClass("over");}); $(".stripeMe tr:even").addClass("alt"); }); </script>



What about when I dynamically load a new part of my page, in response to some user action.  And the new part has a table in it.  The $(document).ready only runs once.  My new table doesn't have the stripey goodness.  Or, if I just reload a table by itself via Ajax?  Or just the tbody rows (hello, paging)?  How about if I just freaking add a new row (insert_before)?

So, hover color changing.  That one is deceptively simple.  Instead of 
.mouseover, you should be doing a 
.live('mouseover',...  That's what '
live' is for, after all.



Now, how about striping?  Well, WTF was this example doing, anyway?  Proving you can play with CSS in Javascript, I guess.  Forget the Javascript part, and just use a CSS selector (.stripeMe tr:even instead of 'alt') 
Done.



Of course, having figured all this out, we started using the jQuery Datatable component, and now it's all irrelevant.  Oh, well.  I learned something.



And, last, but not least



GUID/UUID generation



Ever needed to generate UUID/GUID's? 
[http://en.wikipedia.org/wiki/Globally_unique_identifier](http://en.wikipedia.org/wiki/Globally_unique_identifier)



Nice little gem



[http://mgmullis.wordpress.com/2010/10/07/released-ruby-ffi-uuid-gem/](http://mgmullis.wordpress.com/2010/10/07/released-ruby-ffi-uuid-gem/)



Too bad it doesn't work with the current version of REE (1.8.7) (ffi incompatible with Ruby version < 1.9 now)

[http://groups.google.com/group/ruby-ffi/browse_thread/thread/c40766b574a15962](http://groups.google.com/group/ruby-ffi/browse_thread/thread/c40766b574a15962)



This one works with REE:



[http://www.ruby-forum.com/topic/164078#722535](http://www.ruby-forum.com/topic/164078#722535)



Read the whole thread for all the variations people use to do this. Sort of scary, actually.
