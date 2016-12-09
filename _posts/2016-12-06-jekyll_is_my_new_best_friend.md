---
layout: post
title: Jekyll Is My New Best Friend
categories:
- business
tags:
- software craft
- productivity
status: publish
type: post
published: true
image:
  feature: jekyll-logo-2x.png
---
About a month ago, I decided I had had enough of [Squarespace](https://www.squarespace.com)
and all the weirdness involved in keeping my website there.  

Sure, Squarespace was a handy thing, back when Posterous abruptly shut down, and 
I needed to get my blog moved *fast*. While it made things really easy to import, 
it was not so easy to carry on and continue blogging.  For example, I got into 
the habit of writing posts in Markdown on Blogsy and, while Squarespace purports 
to support Markdown blocks, in practice not so much. Creating new posts became a 
chore, and thus, I started blogging less frequently.  Boo.
![Hyde &amp; Go Tweet](/img/original/tweety-hyde.jpg){:.center-block}

While I could install and customize a template on my Squarespace site, I really 
didn't have the kind of control I was looking for and some of the template stuff 
didn't translate well across the different types of pages I used (static info, 
blog, products).

And yes, I could (and did) advertise and sell things on my website, like tickets 
to my workshops, but the ecommerce integration was clunky and really intended to 
be used with physical, not virtual, products.  The Stripe integration was handy 
and relatively seemless though.

In the end, paying $30/month for something that wasn't really working exactly the
way I wanted, for **any** part of what I wanted to do, seemed ridiculous. I've been
on the lookout for an alternative for some time, and collected tonnes of notes on
various options. Eventually, the alternative just picked itself. 

So a month ago I finally buckled down and got started on migrating the whole thing 
over to [Jekyll](https://jekyllrb.com). I'm a Ruby developer.  Jekyll just makes
sense to me. I know I'll understand how to customize things.  Spent a fair amount 
of time reading the documentation on the main site, and then decided to go 
pick out a template as a starting point, and just get going.

I made one false start when picking out a template.  I started with 
[Minimal Mistakes](https://github.com/mmistakes/minimal-mistakes) template, which 
is really nice, but I ended up wanting a site with a beautiful landing page which 
was *not* the blog. And I wanted other pages that were not the blog.  Minimal 
Mistakes template is really nice, but I found the markup overly complex (this is 
my personal taste, not a general condemnation), and I was not finding it easy to 
make the changes &amp; customizations I desired.

So, back to picking out another [template](http://jekyll.tips/templates/). Ended 
up with something still not ideal, but one that I was really comfortable messing 
around with - [Agency](https://y7kim.github.io/agency-jekyll-theme/).  This one 
**was** really intended to be a one-page site only (that would be the "not ideal"
part), but it was [Bootstrap](https://getbootstrap.com) based, and Jekyll under 
the covers, so really easy to add in all the blogging things.

Why Bootstrap?  Sorry designers, but I am a developer. Bootstrap is something that 
makes a lot of sense to me, and I am comfortable with it's grid layout, how to 
customize things in it, and how to make things fancy with it. Which is exactly 
what I need for messing around on my own site.

About that "easy to add in all the blogging things" comment I made... easy after 
reading a lot of Jekyll documentation, and watching some of the fantastic resource 
videos on the [Jekyll Tips](http://jekyll.tips) site. Also... **plugins**

My Gemfile includes Jekyll plugins like:

```ruby
group "jekyll_plugins" do
  gem "jekyll-archives"
  gem "jekyll-compose"
  gem "jekyll-feed"
  gem "jekyll-haml"
  gem "jekyll-picture-tag"
  gem "jekyll-sitemap"
  gem "jekyll-titleize"
  gem "octopress-paginate"
end
```

Archives and paginate are included so that my older blog posts are accessible/discoverable.
I've got posts back to 2009 in there now, but I also just found my old Mephisto blog 
archive (my pre-Posterous blog), so eventually I hope to import those as well.
Feed and sitemap provide basic Atom feed.xml and a sitemap for my site. Titleize 
because I'm a Rails developer, dammit, and Jekyll didn't have titleize where I 
wanted it.  I do love Haml, but it's not a fully-integrated thing, as I discovered 
when I tried to use Liquid tags in Haml files. Still, for a lot of the page 
partials (includes) you can use Haml markup. Compose provides a handy CLI for 
creating and publishing posts. I'm not actually using 
[Picture Tag](https://github.com/robwierzbowski/jekyll-picture-tag) yet, and I 
may just take that out. We'll see.

One further note about plugins. If you limit your use of plugins to those included 
in the [Github pages-gem](https://github.com/github/pages-gem), you can have a 
seamless deploy to [Github Pages](https://pages.github.com) just by pushing to your 
repository. That's very nice, but I wanted to use additional gems, so I'm rolling
my own deploy.

While I was able to [export](http://www.practicallyefficient.com/2016/04/03/static-and-free.html)/[import](https://gist.github.com/spiffytech/e73777e167dc5a8b6a87) 
my Squarespace blog posts (including images) into Jekyll fairly easily, there were 
some things lost in translation.  I have gone through and edited and spruced up 
about 3 years worth of posts.  Along the way, I ran into all sorts of questions 
about how to do stuff, and weird problems.  Here is a summary of the questions I
had and the solutions I found:

- how the heck do I format [dates](http://alanwsmith.com/jekyll-liquid-date-formatting-examples)
- can I make that iframe I used on some posts [work](http://stackoverflow.com/questions/28617683/can-i-bring-in-a-custom-video-iframe-into-jekyll-markdown-blogs)?
- the embedded images look bad, can I [center](https://thornelabs.net/2014/11/30/centering-images-with-jekyll-and-markdown.html) those?
- some general good advice about Jekyll's [_config.yml](https://mmistakes.github.io/minimal-mistakes/docs/configuration/)
- Why the hell doesn't my responsive [Bootstrap navigation menu](http://stackoverflow.com/questions/21203111/bootstrap-3-collapsed-menu-doesnt-close-on-click) work?
- how do I add nice looking [share buttons](https://superdevresources.com/share-buttons-jekyll/)?

That's about it. Well, except for the actual deployment of my Jekyll site.  But 
this post is long enough, so we'll save the juicy deployment details for another day.









