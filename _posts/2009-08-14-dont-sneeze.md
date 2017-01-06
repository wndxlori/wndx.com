---
layout: post
title: Don't sneeze...
categories: 
- web development
tags: []
status: publish
published: true
meta: {}
---

Yesterday I was having internet issues.  Same as the day before.  Day before was our server/firewall/everything box hanging.  But this was looking like problems with the wifi.  Anyway, I disabled the wifi for a while, and shut down Mail.app and kept working.

(Yes, contrary to popular belief, it is often possible to WORK without the internet.)

A while later, I restarted the wifi, and something wonderful happened.  DNS started working. 

I know, your going - huh?  But the fact is, for about a year, my Macbook Pro has been stuck in IPv6 mode, and it always has to look for any internet address on IPv6, then fail/timeout, then look for it again.  This REALLY slows things down.  REALLY.  Any web page that accesses images from one server, ads from another, and some social web content from another, has to time out on each of these different address lookups.  Yah, that slow.  You should see how slow on a Google Map with additional image layers slow.  Slow, slow, slow.

I have discussed this problem with @phasorburn (because there has to be some benefits to a live-in sysadmin), but after an entire evening trying to figure out WTF was wrong, he gave up too.  "Reinstall from scratch".  Ack.  Haven't done that since I switched to Mac over 5 years ago.  I decided to wait for the Snow Leopard transition, and live with it.  Hating it.  Hate, hate, hate.

But, yesterday, magically, it "just started working".  All my web requests are suddenly lightning fast again.  Ok, they are just "normal", but to me, it seems like lightning fast.

Anyway, don't sneeze or anything.  It might go back to being broken.
