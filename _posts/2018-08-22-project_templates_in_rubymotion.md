---
layout: cta
drip: rubymotion
title: Project Templates in RubyMotion
categories:
- products
tags:
- software craft
- rubymotion
- ruby
status: publish
published: true
image:
  feature: rawpixel-579231-unsplash.jpg
---

<a style="background-color:black;color:white;text-decoration:none;padding:4px 6px;font-family:-apple-system, BlinkMacSystemFont, &quot;San Francisco&quot;, &quot;Helvetica Neue&quot;, Helvetica, Ubuntu, Roboto, Noto, &quot;Segoe UI&quot;, Arial, sans-serif;font-size:12px;font-weight:bold;line-height:1.2;display:inline-block;border-radius:3px" href="https://unsplash.com/@rawpixel?utm_medium=referral&amp;utm_campaign=photographer-credit&amp;utm_content=creditBadge" target="_blank" rel="noopener noreferrer" title="Download free do whatever you want high-resolution photos from rawpixel"><span style="display:inline-block;padding:2px 3px"><svg xmlns="http://www.w3.org/2000/svg" style="height:12px;width:auto;position:relative;vertical-align:middle;top:-1px;fill:white" viewBox="0 0 32 32"><title>unsplash-logo</title><path d="M20.8 18.1c0 2.7-2.2 4.8-4.8 4.8s-4.8-2.1-4.8-4.8c0-2.7 2.2-4.8 4.8-4.8 2.7.1 4.8 2.2 4.8 4.8zm11.2-7.4v14.9c0 2.3-1.9 4.3-4.3 4.3h-23.4c-2.4 0-4.3-1.9-4.3-4.3v-15c0-2.3 1.9-4.3 4.3-4.3h3.7l.8-2.3c.4-1.1 1.7-2 2.9-2h8.6c1.2 0 2.5.9 2.9 2l.8 2.4h3.7c2.4 0 4.3 1.9 4.3 4.3zm-8.6 7.5c0-4.1-3.3-7.5-7.5-7.5-4.1 0-7.5 3.4-7.5 7.5s3.3 7.5 7.5 7.5c4.2-.1 7.5-3.4 7.5-7.5z"></path></svg></span><span style="display:inline-block;padding:2px 3px">rawpixel</span></a>


When you use the `motion create` command of [RubyMotion](https://rubymotion.com), the default behavior is to create a project that builds an iOS application.  But that is only one of many project templates which are available for you to use.

Displaying the help banner of `motion create`, you are presented with a list of the available RubyMotion templates.


```bash
$ motion create --help
Usage:

 $ motion create APP-NAME

      Create a new RubyMotion project from one of the following templates: 
      
        * android
        * flow
        * gem
        * ios (default)
          ---
          description: This template generates a universal iOS app (iPhone, iPad).
        * ios-action-extension
        * ios-admob-rewarded-ads
        * ios-audio-unit-extension
        * ios-broadcast-ui-extension
        * ios-broadcast-upload-extension
        * ios-call-directory-extension
        * ios-content-blocker-extension
        * ios-custom-keyboard-extension
        * ios-document-provider-extension
        * ios-file-provider-extension
        * ios-framework
        * ios-imessage-extension
        * ios-intents-extension
        * ios-intents-ui-extension
        * ios-notification-content-extension
        * ios-notification-service-extension
        * ios-photo-editing-extension
        * ios-share-extension
        * ios-shared-links-extension
        * ios-spotlight-index-extension
        * ios-today-extension
        * ios-watch-app
        * osx
        * tvos
```

As you can see, there are a LOT of templates.  It used to be that these were embedded as part of the RubyMotion command installation.  In recent times, these have been extracted into their own, publicly available, [Github repository](https://github.com/amirrajan/rubymotion-templates).  

When these templates are updated, you can pull the updates down with the `motion repo` command.

If a template has been updated, you will see something like:

```bash
$ motion repo
remote: Counting objects: 7, done.
remote: Compressing objects: 100% (2/2), done.
remote: Total 7 (delta 3), reused 6 (delta 3), pack-reused 0
Unpacking objects: 100% (7/7), done.
From https://github.com/amirrajan/rubymotion-templates
   af6cbc5..775e91c  master     -> origin/master
```

Once updated, running the command again is a no-op.

The templates are stored in a "dot" directory, under your home directory.  If you have any problems with these templates, you can always delete this directory, and then run the `motion repo` command to update it again.

```bash
$ ls -al .rubymotion
total 0
drwxr-xr-x    4 lori  staff   128 13 Jun 20:51 .
drwxr-xr-x@ 177 lori  staff  5664 21 Aug 11:47 ..
drwxr-xr-x   11 lori  staff   352 19 Jul 16:06 rubymotion-command
drwxr-xr-x    7 lori  staff   224 13 Jun 20:51 rubymotion-templates
```

The beauty of having these templates in a repository than can be independently updated, is that they are now decoupled from the RubyMotion release cycle.  If a problem crops up, it can be fixed without a full RM regression test, saving days of waiting.

And there are gems that you can install, which will add additional templates to this list, like the [Red Potion](https://github.com/infinitered/redpotion) gem(s), which will add:

```
        * redpotion-template
```

to the list of available templates.

These templates provide a wealth of example implementations for many important iOS application features (like ios-photo-editing-extension), as well as alternative API's for writing apps (like redpotion-template) and writing apps for other devices (like tvos for Apple TV).

If you'd like to learn more about RubyMotion development, and how to use some of these templates, sign up for our WNDX School of RubyMotion Development mailing list.
