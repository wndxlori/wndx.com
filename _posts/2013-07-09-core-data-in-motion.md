---
layout: post
title: Core Data in Motion
categories:
- Core Data
- RubyMotion
tags:
- RubyMotion
- ruby
- Core Data
- CoreData
status: publish
type: post
published: true
meta: {}
---

Updated June 5, 2015.


Recently I was starting a 
[RubyMotion](http://rubymotion.com) project, mostly as a learning experience and discovered, right from the get-go, that I had a problem. My chosen project, to convert my WIMBY (Wells In My Back Yard) web app to a native application 
seemed like a straight-forward idea, but I had not taken into account some challenges.


Like the fact that 244k abandoned wells (just the abandoned ones, the entire dataset is over 750K) is a 
very large dataset for an iOS app. So large, in fact, that 
[Core Data](http://developer.apple.com/library/mac/ipad/#documentation/cocoa/Conceptual/CoreData/cdProgrammingGuide.html) was just about my only option.


After searching and reading, and reading and searching, I came to the following conclusions:


*There are lots of RubyMotion DSL's and gems for modelling data, but none really gave me all that I needed


*I didn't really understand enough about Core Data to be confident about attempting changes/enhancements to said gems and DSL's.


At that point I just decided to take inspiration from @kellabyte, suck it up, dig in and learn Core Data, and figure it out for myself.


It's been an interesting couple of months (this is a project I am doing on the side). I've learned a lot about Core Data, and I still have a few more things to figure out. But I have successfully:


*Created non-trivial Core Data models in code, with RubyMotion


*Implemented relationships between models, in code


*Pre-loaded my huge dataset


*Learned multiple different techniques for optimization, so that I could efficiently display my wells on maps, and show them in lists


I'll be posting about once a week on each of these topics and reviewing what I learned. I hope you will find it interesting.


If you, too, need to use Core Data with RubyMotion, you will find that the ebook I wrote on these topics (and more) will save you hours, if not days, of research and frustration.
