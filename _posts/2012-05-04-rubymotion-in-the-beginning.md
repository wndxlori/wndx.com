---
layout: post
title: RubyMotion - In the beginning
categories:
- mobile development
tags:
- iOS
- ipad
- iphone
- ruby
- rubymotion
- test
status: publish
type: post
published: true
meta: {}
---

If you are a Ruby developer or an iOS developer, you may have been hiding under a rock and missed the introduction of RubyMotion (
[http://rubymotion.com](http://rubymotion.com)) yesterday. Doubtful, but just in case... RubyMotion is a commercial product, based on MacRuby, which enables you to write iOS apps in Ruby! And if that wasn't enough, Laurent Sansonetti (@lrz of MacRuby fame) is the creator.

 So why am I suddenly so interested in iOS development? Well, it's not so sudden. I signed up for the iOS developer program as soon as it came out. Still haven't released a single app. I've worked on several toy apps, and some prototypes for work, but not to the point of wanting to inflict their mediocrity on others by pushing them to the app store. I just couldn't get *into* iOS development with Objective-C. It was painful and hard and testing was almost impossible. And there was always Ruby & Rails, beaconing me back with beautiful, built-in testing, and clean, clear pleasant-to-read code. 
 Testing. Really. I didn't actually realize, until I was doing some MacOS (not iOS) development, exactly how 'test infected' I had become. I mean, I've been a developer for 25 years, and I didn't start unit testing until my later Java days, so I certainly know that you can develop without testing. I have, however, become impatient with debuggers and the like. I *like* testing. And it was *so hard* to get anything resembling a decent test suite going on my Objective-C/XCode project, that I eventually gave up. That didn't make it any less distasteful, though. 
 RubyMotion comes with testing built in. I downloaded the sample apps (
[https://github.com/HipByte/RubyMotionSamples)](https://github.com/HipByte/RubyMotionSamples)), and here is one of them, with 'rake spec' just built right in and working. 
 $ rake spec 

 Build ./build/iPhoneSimulator-5.1-Development 

 Compile ./app/timer_controller.rb 

 Compile ./app/app_delegate.rb 

 Compile /Library/RubyMotion/lib/motion/spec.rb 

 Compile ./spec/main_spec.rb 

 Create ./build/iPhoneSimulator-5.1-Development/Timer_spec.app 

 Link ./build/iPhoneSimulator-5.1-Development/Timer_spec.app/Timer 

 Create ./build/iPhoneSimulator-5.1-Development/Timer_spec.app/Info.plist 

 Create ./build/iPhoneSimulator-5.1-Development/Timer_spec.app/PkgInfo 

 Create ./build/iPhoneSimulator-5.1-Development/Timer_spec.dSYM 

 Simulate ./build/iPhoneSimulator-5.1-Development/Timer_spec.app 

Application 'Timer' 

 - has one window 
 1 specifications (1 requirements), 0 failures, 0 errors 
 Beautiful! And it's Ruby! 
 Now, don't get me wrong. To write an iOS app, one still has to deal with the CocoaTouch API's. And gawd knows, they aren't the prettiest things in the world. But programming Cocoa in Ruby, with testing all built in, is a FAR more appealing prospect. I was already going to attend an iOS programming workshop this weekend, trying to reboot my interest in iOS development. Now, it looks like I'll be taking that class with Ruby-colored glasses on, and enjoying it so much more than I had imagined. 
 Thanks again, Laurent!
