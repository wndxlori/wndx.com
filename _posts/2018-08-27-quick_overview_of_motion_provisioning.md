---
layout: cta
title: A Quick Overview of motion-provisioning
categories:
- products
tags:
- software craft
- rubymotion
- ruby
status: publish
published: true
feature:
  image: osman-rana-263708-unsplash.jpg
  credit: <a style="background-color:black;color:white;text-decoration:none;padding:4px 6px;font-family:-apple-system, BlinkMacSystemFont, &quot;San Francisco&quot;, &quot;Helvetica Neue&quot;, Helvetica, Ubuntu, Roboto, Noto, &quot;Segoe UI&quot;, Arial, sans-serif;font-size:12px;font-weight:bold;line-height:1.2;display:inline-block;border-radius:3px" href="https://unsplash.com/@osmanrana?utm_medium=referral&amp;utm_campaign=photographer-credit&amp;utm_content=creditBadge" target="_blank" rel="noopener noreferrer" title="Download free do whatever you want high-resolution photos from Osman Rana"><span style="display:inline-block;padding:2px 3px"><svg xmlns="http://www.w3.org/2000/svg" style="height:12px;width:auto;position:relative;vertical-align:middle;top:-1px;fill:white" viewBox="0 0 32 32"><title>unsplash-logo</title><path d="M20.8 18.1c0 2.7-2.2 4.8-4.8 4.8s-4.8-2.1-4.8-4.8c0-2.7 2.2-4.8 4.8-4.8 2.7.1 4.8 2.2 4.8 4.8zm11.2-7.4v14.9c0 2.3-1.9 4.3-4.3 4.3h-23.4c-2.4 0-4.3-1.9-4.3-4.3v-15c0-2.3 1.9-4.3 4.3-4.3h3.7l.8-2.3c.4-1.1 1.7-2 2.9-2h8.6c1.2 0 2.5.9 2.9 2l.8 2.4h3.7c2.4 0 4.3 1.9 4.3 4.3zm-8.6 7.5c0-4.1-3.3-7.5-7.5-7.5-4.1 0-7.5 3.4-7.5 7.5s3.3 7.5 7.5 7.5c4.2-.1 7.5-3.4 7.5-7.5z"></path></svg></span><span style="display:inline-block;padding:2px 3px">Osman Rana</span></a>
---
So what is [motion-provisioning](https://github.com/HipByte/motion-provisioning), anyway? It is a [RubyMotion](https://rubymotion.com) gem that helps you, the developer, take your in-progress app(s) and get them running on your own device(s). This is one of THE major challenges faced by beginning iOS developers, and the motion-provisioning gem makes it as simple as 1,2,3.

As long as you have an Apple developer account (and it *can* be a free one) [motion-provisioning](https://github.com/HipByte/motion-provisioning) automatically performs the following tasks in the Apple Developer Portal for you:

- Creates an application matching your app's name and bundle identifier.
- Creates development and distribution certificates.
- Creates development, distribution and adhoc profiles.
- Registers iOS devices.

All of the tasks listed above require a multi-step process in the Apple Developer Portal. From personal experience, I can tell you it is entirely too easy to mess up one or more of the steps, leaving you baffled and increasingly frustrated as you attempt to load up your app on your own device. It took me days to get it working the first time I tried.

Let's go over the [motion-provisioning](https://github.com/HipByte/motion-provisioning) process, step by step.

### Requirements

You will need a working iOS project. Pick one you have created, or one of the [RubyMotion sample](https://github.com/HipByte/RubyMotionSamples) projects will suffice.

A working Apple Developer account is also **required**.  Go to the [Apple Developer Portal](https://developer.apple.com), select the `Account` link from the top right, and then sign up with your Apple ID if you don't already have one.

<div class="row">
  <div class="col-md-offset-2 col-lg-8">
    {% img img-responsive img-rounded /img/original/apple-developer-account.png title:"Sign up For Apple Developer" %}
  </div>
</div>

### Setting up motion-provisioning

Firstly, you will need to install the motion-provisioning gem.  Add the following line to your project's Gemfile

```
gem 'motion-provisioning'
```

And then bundle install it

```bash
$ bundle
``` 

Next, you will need to configure a certificate and a provisioning profile in your project `Rakefile`.

Inside the app setup block of your `Rakefile`, add the following:

```ruby
app.codesign_certificate = 
  MotionProvisioning.certificate(
    type: :development,
    platform: :ios,
    free: true)
```

This configures your development certificate (see further details about _distribution_ certificates on the motion-provisioning gem [README](https://github.com/HipByte/motion-provisioning#configuration)).  The `free: true` parameter indicates you are using a free developer account.  If you have a paid account, you can leave out that parameter, as it defaults to false. 

Then configure your provisioning profile by adding this to your `Rakefile`, below your certificate:

```ruby
app.provisioning_profile = 
  MotionProvisioning.profile(
    bundle_identifier: app.identifier,
    app_name: app.name,
    platform: :ios,
    type: :development,
    free: true)
```

Again, the `free: true` is used for free developer accounts only.

### Plugging In

You need to plug in your iOS device now.  You also need to ensure that *no other app* is connected to your device.  

If Photos app started up to sync photos from your phone, you need to shut it down.  

If iTunes started up to sync your phone, you need to stop that and disconnect the phone from iTunes.  

Trust me, if you do this a lot, you'll be happier to just disable all those automatically starting/syncing apps, because they constantly interfere with your ability to connect to the device to install an app.

### Running On Device

>If you already have a paid account, and especially if you belong to a team with a paid account, you should probably go read about [sharing certificates](https://github.com/HipByte/motion-provisioning#sharing-certificates) in the motion-provisioning README. It's fairly important, because the next step can *revoke* an existing certificate, and you probably won't want that to happen on a shared cert.

When you next run `rake` for this project, it will attempt to set up your certificate and provisioning profile. It's going to cache this info in a `provisioning` directory in your project, and will use the cached info on subsequent runs.  You should `.gitignore` this directory.  It can be re-created as necessary.

It will start by asking for your Apple ID.  

It will also also ask for your password, which will be stored (securely) in your KeyChain. 

If you use 2FA (two factor authentication), it will prompt for the 6 digit 2FA code sent to one of your auth'd devices.

Basically it looks like this (I have a paid team account, free will look slightly different).

```bash
$ rake
      Info Your Apple ID email: lori@****.***
      Info Do you want to save the email to the config file ('/Users/lori/RubyMotion/swapi_potion/provisioning/config.yaml') so you dont have to type it again? (Y/n): 
      Info Logging into the Developer Portal with email 'lori@****.***'.
Two Factor Authentication for account 'lori@****.***' is enabled
Your session cookie has been expired.
Please enter the 6 digit code: ######
Requesting session...
      Info Selected team "The WNDX Group Inc" (**********).
      Info Found certificate 'iOS Development' which is installed in the local machine.
      Info Exporting private key from Keychain for certificate 'iOS Development'. Choose a password (you will be asked for this password when importing this key into the Keychain in another machine): 
      Info Using certificate 'iOS Development'.
      Info Repairing provisioning profile '(MotionProvisioning) com.your_domain_here.swapi_potion ios development'.
      Info Using provisioning profile '(MotionProvisioning) com.your_domain_here.swapi_potion ios development'.
Name: swapi_potion
Using profile: /Users/lori/RubyMotion/swapi_potion/provisioning/com.your_domain_here.swapi_potion_ios_development_provisioning_profile.mobileprovision
Using certificate: iPhone Developer: Lori Olson (*********)
```

Your app will be registered, your certificate created, and your provisioning profile created.  And lastly, your device will be registered as a development device.  And just like that you are all set up.

Now, your app will build, install and run on your connected device when you run `rake device`.

Pretty slick.  And **SO** much easier than manually managing all that stuff in the Apple Developer Portal.

As always, I recommend that if you have any questions about this, you should pop in to the RubyMotion Slack - [Motioneers](https://motioneers.slack.com) and just ask.  The RubyMotion community is a remarkably friendly and welcoming one for beginners, and there's usually someone around who can help you get going.

[Link to Join Motioneers](http://motioneers.herokuapp.com)  
[Motioneers Slack](https://motioneers.slack.com)

If you found this interesting, there is an entire introductory course - [RubyMotion Jumpstart](https://wndx.school/p/rubymotion-jumpstart) - available at the [WNDX School](https://wndx.school) of RubyMotion development, where you will find an entire lecture devoted to motion-provisioning, just one of the 11 lectures of this full "build an app from scratch" course.  


