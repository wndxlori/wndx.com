---
layout: post
title: Rails problems & solutions - Nov 23, 2010
categories: 
- web development
tags: []
status: publish
published: true
meta: {}
---

Ok, today I get to work on a Rails 3 app.  Yay!  As usual, I'm stumbling over Rails 2/Rails 3 difference issues.  Today's stuff is all about testing and code coverage.



RSpec 2 no can haz has_tag



First up was writing a view spec, and running into this error:



undefined method `has_tag?' for #<ActionView::Base:0x103e86120>



Peer Allan's twitter stream held the questions and the answers, thanks, as usual, to @dchelimsky



[http://twitter.com/#!/peerallan](http://twitter.com/#!/peerallan)



The answer being, have_tag is gone in RSpec 2, use have_selector or similar ilk, and make certain your Gemfile includes webrat (which is where have_selector comes from).



Also, there are some slightly different semantics for specing view partials, and this post



[http://exviva.posterous.com/?tag=rspec](http://exviva.posterous.com/?tag=rspec)



Was quite useful, providing the rendered.should (as opposed to view.should) example.



Next, we're on to ... 



Setting up RCov on Rails 3 project with RSpec 2



I wasn't overly impressed with this stuff about hacking the gem.  I mean really... if you are going that far, why don't you just fork it & fix it, and then do a pull request?



[http://stackoverflow.com/questions/3058676/rcov-with-rspec-2](http://stackoverflow.com/questions/3058676/rcov-with-rspec-2)



This gist was a better answer. 



[https://gist.github.com/670111/5f7e8053499622ee055b13e0ec91ddc9b4fd3944](https://gist.github.com/670111/5f7e8053499622ee055b13e0ec91ddc9b4fd3944)
