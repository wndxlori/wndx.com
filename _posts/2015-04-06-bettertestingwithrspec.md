---
layout: post
title: Better Testing with RSpec
categories:
- software craft
tags:
- ruby
- rails
- workshop
- testing
status: publish
published: true
image:
  feature: better-testing.png
sidebar:
  resources:
    - <a href="https://www.amazon.ca/RSpec-Book-Behaviour-Development-Cucumber/dp/1934356379/ref=as_li_ss_il?ie=UTF8&qid=1483744773&sr=8-1&keywords=rspec&linkCode=li1&tag=twg0f-20&linkId=e715e2c35783d73de6901505cff7c03c" target="_blank"><img border="0" src="//ws-na.amazon-adsystem.com/widgets/q?_encoding=UTF8&ASIN=1934356379&Format=_SL110_&ID=AsinImage&MarketPlace=CA&ServiceVersion=20070822&WS=1&tag=twg0f-20" ></a><img src="https://ir-ca.amazon-adsystem.com/e/ir?t=twg0f-20&l=li1&o=15&a=1934356379" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />
---

Let's get this one question out of the way, right off the bat.  Why RSpec?  or more specifically - why RSpec instead of MiniTest?

For me, the answer was provided with a simple empirical test.  One of my junior developers desperately wanted us to use RSpec on our project instead of Test::Unit (precursor of MiniTest).  We decided it to give it a trial.  I don't think we wrote tests faster.  Or that the specs ran faster.  But... my fellow developers on this project wrote 
better tests 
by far than they had been writing using Test::Unit.


Better tests in this case mean... more finely grained, better focused.  Where before we wrote a single test with 15 or more asserts, now we wrote 8 or 10 specs, most with single expectations.


While I am certain that it was possible for these developers to write better, more finely grained tests using Test::Unit and a little discipline, I am also convinced that we wrote better tests 
by default in RSpec, because of the way in which the specs are structured, and described.


So ever since, I have advocated for RSpec on every project I work on.


Now, it does take a little longer to get up to speed using RSpec, but once you have the basics down, the rich environment of the RSpec core, combined with separate libraries for expectations & mocking provide both power and flexibility.  If you don't like rspec-mock, you can go ahead and substitute the mocking/stubbing framework of your choice. And rspec-rails provides a drop-in replacement for the default Rails testing framework.


The RoR4Real Advanced Topics workshop - Better Testing with RSpec - will help you over that speed-bump of getting started using RSpec, and introduce you to the full power of the RSpec environment covering:


* RSpec basics

  * Setting up your project with RSpec
  * describe & context blocks
  * expectations in detail
  * using test doubles
  * rspec-rails intro
* More advanced concepts

  * writing your own matchers
  * the power of factories
  * integration testing with Capybara


So, to get back to the original question, "Why RSpec", let's see what one of the authors of 
[The RSpec Book](https://pragprog.com/book/achbd/the-rspec-book) had to say:

>RSpec is not just about RSpec. It's about BDD. It's about encouraging
  conversation about testing and looking at it in different ways. It's
  about illuminating the design, specification, collaboration and
  documentation aspects of tests, and thinking of them as executable
  examples of behaviour.  -- David Chelimsky



And that's why I use RSpec.  If you'd like to write better tests in RSpec like a pro, you should sign up (and get 50% off!!) for one of my Advanced Rails Workshops now:

[Signup Now!](/workshops/)

Even if you don't sign up now, if you are intrigued by RSpec, please do 
[vote](https://www.surveymonkey.com/s/ZY8RHXJ) for this topic in my 
[Advanced Rails Workshops Topics Survey](https://www.surveymonkey.com/s/ZY8RHXJ).
