---
layout: cta
title: Don't let build warnings ruin your day
categories:
- software craft
tags:
- 6packapps
- development
- gems
- productivity
- team
status: published
published: true
feature:
  image: matthew-t-rader-mmYDI4p1kfA-unsplash.jpg
  credit: <a style="background-color:black;color:white;text-decoration:none;padding:4px 6px;font-family:-apple-system, BlinkMacSystemFont, &quot;San Francisco&quot;, &quot;Helvetica Neue&quot;, Helvetica, Ubuntu, Roboto, Noto, &quot;Segoe UI&quot;, Arial, sans-serif;font-size:12px;font-weight:bold;line-height:1.2;display:inline-block;border-radius:3px" href="https://unsplash.com/@matthew_t_rader?utm_medium=referral&amp;utm_campaign=photographer-credit&amp;utm_content=creditBadge" target="_blank" rel="noopener noreferrer" title="Download free do whatever you want high-resolution photos from Matthew T Rader"><span style="display:inline-block;padding:2px 3px"><svg xmlns="http://www.w3.org/2000/svg" style="height:12px;width:auto;position:relative;vertical-align:middle;top:-2px;fill:white" viewBox="0 0 32 32"><title>unsplash-logo</title><path d="M10 9V0h12v9H10zm12 5h10v18H0V14h10v9h12v-9z"></path></svg></span><span style="display:inline-block;padding:2px 3px">Matthew T Rader</span></a>
---

Let's talk about warnings.  Specifically, your project build/tests and the warnings they generate when they run.

One of the items we highlighted in DragonRuby Dispatch [last issue](https://dragonrubydispatch.com/2020/01/08/Issue-51#oped--our-unvarnished-opinion) 
is the [EOL of UIWebView](https://dragonrubydispatch.com/2020/01/08/Issue-51#drsh--dragon-riders-slack-highlights). The 
deprecation of [UIWebView](https://developer.apple.com/documentation/uikit/uiwebview?language=objc#) has been coming at 
us for quite some time, and I really think this EOL should be a non-issue. I mean, I had my co-op student go and fix all 
the occurrences of [UIWebView](https://developer.apple.com/documentation/uikit/uiwebview?language=objc#) in the 
[Motion-In-Motion](https://github.com/orgs/motioninmotion/teams/wndxgroup/repositories) sample code back in the summer 
of 2018 (that was a LOT of PR’s). And the deprecation had been around for a while then.

Shall we review for a moment WHY we shouldn’t be ignoring warning messages in our code? Think of these warning 
messages like the broken windows from [broken window theory](https://en.wikipedia.org/wiki/Broken_windows_theory). 

> The broken windows theory is a criminological theory that states that visible signs of crime, anti-social 
> behavior, and civil disorder create an urban environment that encourages further crime and disorder, including 
> serious crimes. The theory suggests that policing methods that target minor crimes such as vandalism, public 
> drinking, and fare evasion help to create an atmosphere of order and lawfulness, thereby preventing more 
> serious crimes.

This comparison is, in my experience, so deadly accurate. The first warning in your code doesn't seem like it's
much of a problem. It'll take valuable time to fix, you tell yourself. Time that could be spent developing new 
features, or fixing bugs. Visible stuff that your boss or your users will see and care about. Fixing a warning? 
You (and the other developers of your team) are the only one(s) who will ever care about it. You make a note in the PR, 
maybe leave a TODO somewhere, and move on.   

Or ... will they ALL care, sooner or later? When one warning turns into 5, then 10, and then more. Your users will care 
about that  bug slips by (aka the "serious crime" from broken window theory), because you didn't see the IMPORTANT 
warning message generated by your build.  The warning that was hidden 
down in all the other warning messages that you've been ignoring. Your boss will care, when he thinks you only 
need to upgrade that one gem or library to protect your app from that zero-day exploit, but it turns out you've been 
ignoring the deprecation warnings from 5 other gems that depend on the old, insecure version of THAT gem, and a one hour 
fix-to-deploy is going to turn into a 2 day project requiring a full regression test. You'll care, when you are trying 
to track down a bug, but you can't find the logging message related to the problem, because of all the other crap warning 
messages that have been spewing into your log file.  Your team mates will care, when the framework upgrade gets stalled, 
then cancelled, because it was no one could navigate all the problems and errors it caused, in among all the warnings 
you've been ignoring (why yes, I have in fact been on one of those teams).  

![](/img/original/red-alert.gif){: .img-responsive .center-block}
 
The more we ignore warning messages, the more it encourages us to ignore new warning messages, which eventually leads 
to a code base that we will hate working on. A code base that is nearly impossible to upgrade. A code base where we 
can’t find the REAL problems, because they are hiding down in the weeds of the problems we’ve been ignoring all along. A
code base that *encourages* disorder (again with the broken window theory).

So let’s get out there and clean up some of those warning messages. Because some day, they ARE going to 
come and bite us when it’s going to really hurt. I’m looking at YOU, [Evernote](https://github.com/evernote/evernote-cloud-sdk-ios/search?q=uiwebview&unscoped_q=uiwebview).

Ok, that's probably enough for this post.  Some other time, I'll talk about the the dark side of over-policing when it 
comes to warnings.