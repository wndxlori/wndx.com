---
layout: cta
title: 3 Steps To Solving RubyMotion Build Woes
categories:
- products
tags:
- rubymotion
- ruby
- gems
- rake
status: publish
published: true
meta: {}
---
Seems every few months, there is [another](http://community.rubymotion.com/t/rm-is-suddenly-only-compiling-my-app-code/14330) [weird](http://community.rubymotion.com/t/redpotion-error-building-vendor-project-vendor-pods-failed-to-create-at-least-one-a-library/1015) [build](http://community.rubymotion.com/t/could-not-find-rake-10-4-2-in-any-of-the-sources/195) [error](http://community.rubymotion.com/t/rake-pod-install-uses-ruby-2-0-0-not-2-3-1/1672) that someone is attempting to track down when running `rake` to build their project in RubyMotion. The context of these errors is generally unique to the project they are running in, and often surface while compiling an included gem (ie, not in **your** code), and so it is difficult to Google your way to an answer on Stack Overflow ;-)

Recently [Andy Stechishin](https://motioneers.slack.com/team/apstechisin) discovered a pattern in his weird [build problems](http://community.rubymotion.com/t/rm-is-suddenly-only-compiling-my-app-code/1433/8), in which he uncovered a version mismatch with an updated version of `rake`.

One quick way of discovering if this is your problem, is to run:

`rake --version`

and

`cat Gemfile.lock | grep rake`

to compare your default rake with your project rake. If you have different `rake` versions, that could very well be the source of your build problem.

It's all very well to discover *what* caused the problem, but what you really want is to know *how* to FIX the damn build error, so you can get back to work.  The answer in this case is simple:

`bundle exec rake`

A more complete answer, however, involves a few steps which will make your build woes a thing of the past.

1. **Use bundler**  
  I know the [RubyMotion Getting Started](http://www.rubymotion.com/developers/guides/manuals/cocoa/getting-started/) 
  documentation doesn't mention using [bundler](http://bundler.io/v1.12/#getting-started), but any Ruby/RubyMotion development is done using **gems**. And using 
  **gems** without using [`bundler`](http://bundler.io/v1.12/#getting-started) is just asking for a world of hurt.
  
1. **Use a Ruby version manager**  
  Although your Mac comes with a system version of Ruby installed, I still **strongly** recommend you 
  install and use a Ruby version manager like [RVM](https://rvm.io) or [rbenv](https://github.com/rbenv/rbenv)
  or [chruby](). I personally prefer RVM. Its documentation is superior, and does not make assumptions about 
  your wizard-like (or lack thereof) shell scripting skills. Also, with RVM you can seamlessly use 
  [gemsets](https://rvm.io/gemsets/basics), which is absolutely required, as soon as you have more than one 
  Ruby project on the go.

1. **Include both your Ruby and Rake versions in your Gemfile**  
  This ensures that when you have a `rake` or a `ruby` version mismatch, `bundler` is going to complain about it. If you put 
  this in your Gemfile for instance:<br/>
  ```
  ruby '2.3.3'
  ```
  <br/>
  then if you are using a different (system) Ruby, bundler will complain like:
  <br/>
  ```
  Your Ruby version is 2.0.0, but your Gemfile specified 2.3.3
  ```
  
With these simple steps, you should be on your way to taking control of your RubyMotion build, and your
inexplicable build failures should be a thing of the past.  That's not to say you won't ever have more gem
build failures, but they should at least be directly related to the code involved.
  
  
