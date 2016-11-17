---
layout: post
title: RubyMotion and CocoaPods
categories:
- mobile development
tags:
- cocoapods
- iOS
- ruby
- rubymotion
status: publish
type: post
published: true
meta: {}
---

So, before you go very far with the 
[RubyMotion](http://rubymotion.com), you will probably run into the need for 
[Cocoapods](http://cocoapods.org/) and 
[motion-cocoapods](https://github.com/HipByte/motion-cocoapods).  I know that was the fact for me, when I stumbled across a link to 
[https://github.com/foeken/CarenMotion](https://github.com/foeken/CarenMotion), and wanted to see how it worked. 

As a Ruby developer with a lot of different projects on my plate, it was perhaps inevitable that I would be slightly perplexed at this point.  RubyMotion is self-contained, with it's own Ruby implementation.  But motion-cocoapods and cocoapods itself are gems to install.  So, under which Ruby (I have 6 different Ruby/versions installed via rvm) should these be installed?

Thinking I was being logical, I started with MacRuby. 

$ rvm use macruby
Using /Users/lori/.rvm/gems/macruby-0.10



lori@wndx ~
$ gem list

*** LOCAL GEMS ***


lori@wndx ~
$ gem install cocoapods

Building native extensions.  This could take a while...

ERROR:  Error installing cocoapods:

    ERROR: Failed to build gem native extension.

So much for that bright idea.  Thinking that total n00bs wouldn't even have rvm installed, I figured I'd go for the next easiest ruby, the System ruby, because I don't use it for anything at all.



$ rvm use system
Now using system ruby.

lori@wndx ~
$ sudo gem install cocoapods
Password:
Fetching: xcodeproj-0.1.0.gem (100%)
Building native extensions.  This could take a while...
Fetching: cocoapods-0.5.1.gem (100%)
[!] If this is your first time install of CocoaPods, or if you are upgrading, first run: $ pod setup
Successfully installed xcodeproj-0.1.0
Successfully installed cocoapods-0.5.1
2 gems installed

lori@wndx ~
$ pod setup
Cloning spec repo `master' from `git://github.com/CocoaPods/Specs.git'

lori@wndx ~

$ sudo gem install motion-cocoapods

Fetching: motion-cocoapods-1.0.1.gem (100%)

Successfully installed motion-cocoapods-1.0.1

1 gem installed

Yay.  All nice and installed.  And, testing by running rake on the CarenMotion app, I confirm it works just fine. 

 

Now, on to a test project of my own.  I'll be re-implementing the sample project from the iOS Dev School class I took this weekend.  This is a decidedly non-trivial example, so I'm really looking forward to it!
