---
layout: 6pa-cta
title: Deploying Jekyll
categories:
- business
tags:
- software craft
- productivity
- ruby
status: publish
published: true
image:
  feature: jekyll-logo-2x.png
sidebar:
  resources:
    <a href="https://hydepress.github.io/index.html"><img src="/img/original/hyde-press.png" class="img-responsive"/></a>
---
This is the second post about the move of my website from a hosted site on
[Squarespace](https://www.squarespace.com) to a self-hosted 
[Jekyll](http://jekyllrb.com) site. You can find my first post 
[here]({{ site.baseurl }}{% link _posts/2016-12-06-jekyll_is_my_new_best_friend.md %}).

### Deploy via Github Pages

![](/img/original/github-pages.png){: .img-responsive .center-block}

While part of Jekyll's attraction is to effortlessly deploy your site on 
[Github](http://github.com) via [Github Pages](https://pages.github.com), so of course
I chose not to do this.  You see, with the Github-hosted Jekyll sites, you are limited
to the officially "blessed" set of Jekyll plugins, that are enumerated in the Github 
[pages-gem](https://github.com/github/pages-gem).

```ruby
      # Plugins
      "jekyll-redirect-from"   => "0.12.1",
      "jekyll-sitemap"         => "0.12.0",
      "jekyll-feed"            => "0.8.0",
      "jekyll-gist"            => "1.4.0",
      "jekyll-paginate"        => "1.1.0",
      "jekyll-coffeescript"    => "1.0.1",
      "jekyll-seo-tag"         => "2.1.0",
      "jekyll-github-metadata" => "2.3.1",
      "jekyll-avatar"          => "0.4.2",

      # Plugins to match GitHub.com Markdown
      "jemoji"                       => "0.8.0",
      "jekyll-mentions"              => "1.2.0",
      "jekyll-relative-links"        => "0.3.0",
      "jekyll-optional-front-matter" => "0.1.2",
      "jekyll-readme-index"          => "0.0.4",
      "jekyll-default-layout"        => "0.1.4",
      "jekyll-titles-from-headings"  => "0.1.4",
```      
      
These plugins are "white-listed", and will be enabled when your site is automagically
built as you push your changes up. These plugins represent a nice list of default
functionality, and will suit many people who want a small site, or are just starting
out with blogging.

The flip-side of that however is plugins other than that limited list are black-listed
and disabled.  

And of course one of the first plugins I decided I could not live without -
[jekyll-archives](https://github.com/jekyll/jekyll-archives) - turns out to be one of
the unblessed. Grumble, grumble. Any decent size blog that has been around for a
while, is bound to want at least some way of surfacing related content or historical
content.  I use both categories and tags for mine.  Without something like
[jekyll-archives](https://github.com/jekyll/jekyll-archives), it's impossible for my
blog to be navigable. Sure, I could roll my own, but why the hell should I, when
[jekyll-archives](https://github.com/jekyll/jekyll-archives) is already available and
does such a nice job?

Ok, if the default, automagic deploy on Github Pages is out, what's the next step?

### Deployment Alternatives

Well... the "official" alternative is to build your Jekyll site locally with `jekyll
build` and then add, commit and push your generated `_site` directory up to Github.
Sorry, but as a developer, you can check [build artifacts into my repository](https://www.reddit.com/r/programming/comments/2e1024/keep_your_build_artifacts_in_the_repository/)
OVER MY COLD DEAD BODY.

Now that we have that perfectly clear, let's see what the OTHER alternatives are.

### Real Deployment Alternatives

The Jekyll site has quite the laundry list of [deployment methods](https://jekyllrb.com/docs/deployment-methods/)
from which to choose.

- ftp
- scp
- git hooks
- Static Publisher
- rsync
- roll-your-own Rake
- Rack Jekyll
- Amazon S3
- Continuous Integration

It's a long list, and it didn't make me very happy to have yet more investigation and
hurdles to plow through before getting my site deployed.  Eventually I decided to go
with what I know.  As a Rails developer, I've used [Capistrano](http://capistranorb.com)
to deploy my Rails applications since before it was called Capistrano (pop quiz...
what did it used to be called?).  Since a number of my single page project/product
sites are deployed to [Digital Ocean](https://m.do.co/c/cdc68a7477b9) already, it
made sense to just piggy-back onto one of those droplets.

### Capistrano to Digital Ocean... how hard could it be?

I looked up a couple of blog posts on the topic, and eventually ended up with this
one on [dsgn.io](https://2016.dsgn.io/thoughts/post/jekyll-deployment-with-digitalocean/).

Let me start by passing on the hardest learned lesson (and I really should have known
better).  DO NOT use [Cap 3](http://capistranorb.com). The version you want to use is
[Cap 2](https://github.com/capistrano/capistrano-2.x-docs). Which is just what that
post above mentions, but fails to detail the "why" (and I should have remembered...).  

<div style="position:relative;height:0;padding-bottom:75.0%"><iframe src="https://www.youtube.com/embed/NCa08W43j8w?ecver=2" width="480" height="360" frameborder="0" style="position:absolute;width:100%;height:100%;left:0" allowfullscreen></iframe></div>
----

Short answer... Cap 2 has a lovely, simple deployment strategy built in -
`:deploy_via, :copy`. This strategy was never re-integrated when Capistrano was
rebuilt from the ground up for V3. There are lots of half-assed attempts to add it
back in, but none as elegant and simple to use as the original.  Cap 2.  Just do it.

Overall I really like this deployment. A simple `cap deploy`, and it rebuilds my
Jekyll site locally, and then shoves the files up to my droplet. It also has the
advantages of "rollback", which has always been one of my favorite Capistrano
features. It's also super extensible, so if you find yourself wanting to do more,
it's easy to add additional deployment steps (guess I'll need a third post about
that, eh?).  

I do have a couple of differences from the post above. I have multiple sites 
deployed on the one droplet.  So just using the default Apache wasn't going to work
for me.

So, instead of using:

```ruby
set :deploy_to, "/var/www/html"
```
I used:

```ruby
set :deploy_to, "/var/www/wndx.com"
```
I also decided to add my apache vhost to the `deploy:setup` step like this:

```ruby
# Adds Apache virtual host to sites_available
after "deploy:setup", "deploy:add_vhost"

namespace :deploy do
  [:start, :stop, :restart, :finalize_update].each do |t|
    desc "#{t} task is a no-op with jekyll"
    task t, :roles => :app do ; end
  end

  desc "Setup apache virtual host"
  task :add_vhost, :roles => :web do
    apache_vhost = <<-VHOST
<VirtualHost *:80>
  ServerAdmin ****@****.***
  ServerName wndx.com
  ServerAlias www.wndx.com
  DocumentRoot /var/www/wndx.com/current

  # Available loglevels: trace8, ..., trace1, debug, info, notice, warn,
  # error, crit, alert, emerg.
  # It is also possible  configure the loglevel for particular
  # modules, e.g.
  #LogLevel info ssl:warn

  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined

  RewriteEngine on
  RewriteCond %{SERVER_NAME} =wndx.com [OR]
  RewriteCond %{SERVER_NAME} =www.wndx.com
  RewriteRule ^ https://%{SERVER_NAME}%{REQUEST_URI} [END,QSA,R=permanent]
</VirtualHost>
VHOST
    put apache_vhost, "/etc/apache2/sites-available/wndx.com.conf"
  end
end
```

My full (initial) deploy.rb can be found [here](https://github.com/wndxlori/wndx.com/blob/f3b0b676072545183a24e1702debec65b1a964dd/config/deploy.rb),
and the full commit where I added the deploy, which might be enlightening for
specific nitty gritty details, is right [here](https://github.com/wndxlori/wndx.com/commit/f3b0b676072545183a24e1702debec65b1a964dd).

Before we end, let me address a couple more of the "but why didn't you" type
questions that I can predict are hovering at your fingertips.

![](/img/original/KISS.png){: .img-responsive .center-block}

### Deployment strategies I discarded
There are several other deployment options that seem attractive, and that a part of
me wanted to try.

- Travis CI
- git posthook  

And I nixed them for the same reason. I do NOT want to build my site on the droplet.
I am NOT going to maintain a full Ruby development toolchain on my static site
servers. Never. The static sites are nice and simple, and that's the way I like them.
Get a web server running (Apache or Nginx), add the SSL cert, and then push up some
files and done. Heck, I don't even want to install `git` on those servers.

### Why not Nginx?
I know, I know.  Why use Apache?  Why not Nginx?  That's sheer laziness on my part.
On my Digital Ocean droplet I can install a pre-built Apache, and get a vhost set up
mostly out of my own head, or out of the default settings files. If I use Nginx,
there's a few more steps, and I have to look up how to set up server blocks and ...
ok, I'm lazy. At some point, I might need Nginx, but right now I don't, so Apache it is.

### Other resources

Check out the sidebar, where I have linked to a fabulous resource of free ebooks on
many Jekyll sub-topics.

### Pop quiz answer

And the answer is... Capistrano's original name was [Switchtower](http://weblog.rubyonrails.org/2006/3/6/switchtower-is-now-capistrano/).
Let that serve as a lesson to you when naming your projects.

<hr/>