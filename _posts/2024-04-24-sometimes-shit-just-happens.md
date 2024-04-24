---
layout: cta
title: Sometimes... Shit Just Happens
categories:
- software craft
tags:
- maintenance
- development
- entrepreneur
status: published
published: true
feature:
  image: custom-domain.png
  caption: We recommend verifying your custom domain before adding it to your repository, in order to improve security and avoid takeover attacks 
---

In which we learn how one of Lori's websites got hijacked.

### How It Started

I've been working on some long-outstanding to-do's lately, and one of those to-do's was to update the [DragonRuby
Dispatch website](https://dragonrubydispatch.com).  I didn't have much time left last Thursday, at the end of my work week (Friday's are now for other
things, like helping out my 89 yr old mom) and I quickly merged an automated security pull request, and then left the
other things for the coming week.

### What Went Wrong

Unfortunately, that pull request managed to "break the build" of my GitHub Pages site. So what happens 
when your GitHub Pages build breaks? Well, your site suddenly starts 404'ing. That is to say, you get a 
"Page not found" error.

This website is a static site, built using [Jekyll.rb](https://jekyllrb.com). Now, Jekyll is the basis 
of [GitHub Pages](https://pages.github.com/), and this particular site is my one and only Pages site, using a custom domain.  I have 
several other Jekyll sites, but they all use versions of Jekyll or Jekyll plugins that are not supported 
by Pages. So if I break the build on any of my other sites, I simply don't deploy it, until it is fixed.

But, with GitHub Pages, a broken build means a broken website. Sigh. Who knew I should be using branches and
pull requests on my own damn static website repository.

Now, I didn't know I broke the build until I looked at my work email almost a day later, as I was
killing time, waiting for my mom at her hair appointment.  It didn't really concern me, because... whatever 🤷🏻‍♀️, I'll get
it fixed when I get back to it next week. However, when I looked at the rest of my work email, I saw a
weird, concerning email about a "new owner" on this domain from Google Search. Specifically **"Google has 
identified that rajaprincess88@gmail.com has been added as an owner of https://dragonrubydispatch.com/"**.
I quickly logged in to Google, double-checked, and found no sign of any fraudulent access to my Google 
settings, so I put that on the back-burner to dig into further next week, too.

### The Investigation

Another glance at my work email on Saturday morning revealed additional weird error emails about my 
domain from Google Search. Specifically - **"Search Console has identified that your site is affected 
by 2 Merchant listings structured data issue(s)".** Really puzzled now, I clicked through from Google 
to my website, and lo and behold... some stupid foreign Poker site had taken its place. **My custom 
domain had been hacked!**

I yelled rather loudly about this to my (now retired) Linux and network systems admin husband, Trever. 
He started digging in to it. Meanwhile, I checked my domain registrar. It's got ALL my domains, and 
furthermore uses MFA, so I was pretty sure it was ok.  I checked and all my DNS settings matched up 
with what the GitHub Pages documentation said they should be.  Now I was very puzzled.  If GitHub was 
still handling my DNS, how could my website be hacked?

Turns out, fairly easily, especially for an older GitHub Pages repository. After Trever and I searched 
quite a bit into this, and similar issues, we found that hackers have multiple ways to hijack your custom 
domain on GitHub Pages, if you don't have all your settings (including settings that didn't exist when 
I created this repo) JUST RIGHT.

The first way a hacker could infiltrate your domain is if you created a "wildcard" DNS record 
(*.example.com). If you verify example.com, but have a wildcard record, things like a.example.com
are safe, but a hacker could take over b.a.example.com. 🙄

The second way a hacker can hijack your domain is if it is configured with the GitHub domain servers
AND your domain is not currently deployed/active AND you don't have a verified domain. This is what 
happened to me.  Verification did not exist when I created this domain. Then, when I broke the 
build... it was [suddenly exposed](https://github.com/orgs/community/discussions/29068#discussioncomment-8764149).

P.S. Based on the timestamps of the broken build, and the first weird Google email, it took them a
whole 2 minutes to hijack my domain.

### The Fix

So the very first step, is VERIFY YOUR DOMAIN.

Go to your GitHub account "Settings". Under the "Code, Planning, and Automation" section, select "Pages".
Then "add a domain".  At this point, you enter your domain name, and then taking the provided 
"hostname" and "value" to your Domain Registrar, you add a TXT record to your DNS settings, and make 
sure that your TTL (time to live) is set to 5 minutes or less, so you don't have to wait around for the 
setting to propagate, so you can hit the big green "verify" button back on GitHub.

Now you can go back to your GitHub Pages repository, and add your domain to the "custom domain" under 
[settings](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site#configuring-an-apex-domain). 
Of course, at this point the hacker still has your domain pointed to their own repository, SO IT DOESN'T
WORK.

![The coyote on a spring loaded platform, cutting the release cord, and being slammed 180&deg; into the road](/img/original/coyotespringloadfail.gif "Wile E Coyote face-plant"){: .img-responsive .center-block}

It will take 7 days for that domain you verified to revert to you. Or you can do like I did, and open 
a support ticket and ask GitHub Support to release the domain, so you can fix it more promptly. That took 
about 36 hours for me.

THEN, you go add your custom domain to your GitHub Page's Settings. And poof! It works. OR not, if your
build is still broken. Well, at least now it was back to 404'ing, and not some damn poker site.  An hour 
or so later of tweaking, and [DragonRuby Dispatch](https://dragonrubydispatch.com) was back in action.

### Lessons Learned

There's a few lessons to be learned here.  I am guilty of largely ignoring my static websites for the
past few years. And this came back and bit me. HARD. Maintenance is a necessary evil, even with something
as seemingly simple as a static site. Review and update ALL the things, at least yearly.

I was also guilty of "pushing to production" at the very end of my work week.  Don't do that. At least,
not if you don't want to spend your Saturday futzing around fixing things.

Last, but not least, it can take seconds (ok 2 minutes) for a hacker to take over your domain. And then
a week to get it back. This is not a good look on GitHub Pages, and I suspect I will be removing Pages 
from my recommended options to clients for their landing pages in the future.

