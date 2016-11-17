---
layout: post
title: Girls Learning Ruby
categories:
- ladies learning code
tags: []
status: publish
type: post
published: true
meta: {}
---

I had the opportunity last week to teach one of the Calgary based 
[Girls Learning Code workshops](http://ladieslearningcode.com/chapters/calgary/) for the first time.  It was quite a learning experience, for everyone, so I thought I'd write up some of the fun things we learned.
  
      
[![](/squarespace_images/static_50d2902fe4b0959a0871a12c_50d29312e4b04687d9db341b_54f11ecbe4b0376cee6be391_1425088215970__img.png)](http://calgary.ladieslearningcode.com)
  



I was asked if I'd be interested in teaching this workshop back in December, and I immediately said yes.  Having already taught and mentored for the Ladies Learning Code workshops, I thought teaching kids would be fun.  Like the LLC workshop, I knew that this workshop had already been given in Toronto, and that the materials from that would be available.


Ksenia asked me to review the materials, so I did.  It looked like a "dumbed down", shorter version of the adult workshop.  In a fit of laziness, I just said it would be fine.  However, when Ksenia followed up with me, and mentioned that the material was a little ... dry, and lacking in "fun factor", I had to confess to having similar thoughts.  So, I started investigating ways of making the workshop "more fun".


The first thing that sprung to mind was 
[KidsRuby.com](http://kidsruby.com).  After a quick review of the website, and some of the training materials, I was sold, especially since KidsRuby has embedded 
[Artoo.io](http://artoo.io), and you can program ROBOTS with it.  I have a 13 year old nephew, and he absolutely loves the 
[Sphero](http://www.gosphero.com) I got him as a Christmas present, after seeing the Artoo.io intro at RubyConf 2013.




Unfortunately, it seems that KidsRuby is in a bit of flux at the moment.  The installers don't work on the most 
[recent releases of OSes](https://github.com/hybridgroup/kidsrubyinstaller-osx/issues/11).  It seemed to me that if we couldn't guarantee it would run for all the students in the class, we really couldn't use it.  I did download the source materials for the installer and attempt to get the installer building/working so that I could fix it up, but I had problems with it, and no one was able to respond to my problem reports over the period of a 
[couple of weeks]((https://github.com/hybridgroup/kidsrubyinstaller-osx/issues/11)), so I had to give it up. (Not throwing blame around here.  Open source can be a labour of love, but sometimes real life gets in the way.  I was on a schedule, however...)


So, we defaulted back to the basic RubyInstaller, the command-line, and editing files with Sublime Text.  Not ideal for kids, and certainly more work for the mentors, but it was good enough.


Now, about those course materials...


I reviewed some of it, in an overview fashion, with my nephew.  He agreed with my first impression that the Twitter example wouldn't be that interesting to kids.  In his words... "Everyone HAS a Twitter account, but no one actually USES it."  So, the Twitter example had to go.


A second issue arose from that review.  The Madlibs examples are cool and a lot of fun.  But the original class was presented to 13 year olds, who could all be expected to understand the parts of speech (nouns, verbs, adjectives, adverbs).  In our class, we had 8-13 year olds (actually, we also had a couple 6 year olds o_O).  At least some of those would need help with the parts of speech, so we added a quick little grammar review, and wrote some examples on the white boards during the workshop, so that the kids had help with their Madlib exercise. Lots of giggling involved, so I think they enjoyed it.


One thing did stick from KidsRuby - Robots.  Because robots are cool.  I bargained with my nephew, and he agreed to let me "borrow" his Sphero for the workshop, if he was allowed to come along.  Seemed fair to me.  He & I spent a fun afternoon getting everything set up to have a Robots! demo at the end of the workshop with his Sphero.


Cribbing heavily from the 
[KidsRuby class notes](https://github.com/hybridgroup/kidsruby-class-1), we replaced the Twitter stuff with some new basic logic material, and I introduced some basics on looping.  The final version of the class material used is in this Github branch 
[here](https://github.com/wndxlori/glc-ruby/tree/yyc-feb21). Once we covered all that, I was pretty sure that the students would be able to grasp the Artoo.io Sphero demo code without too much trouble.


I sent all that to Ksenia.  She also suggested an "icebreaker" exercise at the beginning of the class, which was an excellent idea, and got the girls very engaged.


All in all, I was happy that we prepared so well.  The workshop was well attended (most popular one so far!) with 22 students and 7 (or 8 or 9?) mentors, and went fairly smoothly.  Had one hiccup, when the USB sticks I had prepared (with backup downloads and course materials) ended up formatted only for Mac #facepalm, but one of our fabulous mentors, 
[Tim](https://twitter.com/timuruski), was able to quickly re-format enough copies for all the Windows-based students to use.  We did run out of time at the end, leaving the final exercise as "homework", but got our Sphero demo to run, just about the time that all the parents showed up to take the kids home.
  
      
[![](/squarespace_images/static_50d2902fe4b0959a0871a12c_50d29312e4b04687d9db341b_54f11e85e4b0d588cecaff91_1425088166782__img.jpg)](http://calgary.ladieslearningcode.com)
  


I have to close by thanking the amazing Girls Learning Code team at 
[@ChicGeekYYC](http://thechicgeek.ca).  
[Ksenia](https://twitter.com/ksenia_nadkina), 
[Darcie](https://twitter.com/derushie), and Jocelyn put in an amazing amount of effort to run these workshops, and to make certain that they are free. And to thank all the mentors who helped make my job as instructor pretty easy.  I'm not certain if all the attendees and parents realize, but these Girls Learning Code workshops are free because of the efforts of the 
[@ChicGeekYYC](https://twitter.com/ChicGeekYYC) team, the instructors, and the mentors, all volunteering their time to teach coding skills to young girls.  And, of course, the sponsors like 
[@AssemblyCS](https://twitter.com/AssemblyCS), who donate their spaces to hold these workshops.


I am already looking forward to new Girl's Learning Code workshops.  I hope to set up a chapter down home in Lethbridge before the year is out.  I know my nephew really enjoyed the workshop and is 
extremely interested in attending another, so I have hopes that the rest of the students enjoyed this one as much as he and I did.
