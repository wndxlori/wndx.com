---
layout: post
title: 'How to use models in your migrations (without killing kittens) - Gem Session:
  ruby on rails'
categories:
- web development
tags:
- activerecord
- migrations
- rails
- ruby
status: publish
published: true
meta: {}
--->Fortunately, there is a way to use ActiveRecord magic in your migrations and still get the girl. By inlining classes you decouple your migration from any future changes in your models.



via 
[gem-session.com](http://gem-session.com/2010/03/how-to-use-models-in-your-migrations-without-killing-kittens)
    
I've used this technique before, but here it is taken to an extra level.  Worth reading if you've got a lot of migrations.
