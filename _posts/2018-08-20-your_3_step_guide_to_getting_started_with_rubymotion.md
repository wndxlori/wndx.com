---
layout: cta
title: Your 3 Step Guide to Getting Started with RubyMotion
categories:
- products
tags:
- software craft
- rubymotion
- ruby
status: publish
published: true
image:
  feature: tyler-lastovich-720622-unsplash.jpg
  credit: <a style="background-color:black;color:white;text-decoration:none;padding:4px 6px;font-family:-apple-system, BlinkMacSystemFont, &quot;San Francisco&quot;, &quot;Helvetica Neue&quot;, Helvetica, Ubuntu, Roboto, Noto, &quot;Segoe UI&quot;, Arial, sans-serif;font-size:12px;font-weight:bold;line-height:1.2;display:inline-block;border-radius:3px" href="https://unsplash.com/@lastly?utm_medium=referral&amp;utm_campaign=photographer-credit&amp;utm_content=creditBadge" target="_blank" rel="noopener noreferrer" title="Download free do whatever you want high-resolution photos from Tyler Lastovich"><span style="display:inline-block;padding:2px 3px"><svg xmlns="http://www.w3.org/2000/svg" style="height:12px;width:auto;position:relative;vertical-align:middle;top:-1px;fill:white" viewBox="0 0 32 32"><title>unsplash-logo</title><path d="M20.8 18.1c0 2.7-2.2 4.8-4.8 4.8s-4.8-2.1-4.8-4.8c0-2.7 2.2-4.8 4.8-4.8 2.7.1 4.8 2.2 4.8 4.8zm11.2-7.4v14.9c0 2.3-1.9 4.3-4.3 4.3h-23.4c-2.4 0-4.3-1.9-4.3-4.3v-15c0-2.3 1.9-4.3 4.3-4.3h3.7l.8-2.3c.4-1.1 1.7-2 2.9-2h8.6c1.2 0 2.5.9 2.9 2l.8 2.4h3.7c2.4 0 4.3 1.9 4.3 4.3zm-8.6 7.5c0-4.1-3.3-7.5-7.5-7.5-4.1 0-7.5 3.4-7.5 7.5s3.3 7.5 7.5 7.5c4.2-.1 7.5-3.4 7.5-7.5z"></path></svg></span><span style="display:inline-block;padding:2px 3px">Tyler Lastovich</span></a>
---
As with most programming languages, the best way to start is with a quick "Hello World" example, to make certain you have all the basics in place.  Let's see how that's done in [RubyMotion](https://rubymotion.com).  

> Pssst! If you are a more visual learner, and prefer watching videos to reading blog posts, check out our **free preview video** of the material covered in this post, right [*here*](https://wndx.school/courses/rubymotion-jumpstart/lectures/3113681?utm_source=blog&utm_medium=post&utm_campaign=rj_launch_201807) in the [WNDX School](https://wndx.school).


## Step 0

Ok, I lied just a little in that title.  Before we can get started, we should make certain that you have all the necessary *requirements* for RubyMotion development.

#### Apple Computer

You will need a Mac (MacBook, iMac, Mac Mini, Mac Pro). Both RubyMotion & Apple iOS (iPhone/iPad) development require macOS to work. If you actually need to buy a Mac, remember that the original RubyMotion was created on a MacBook Air (an underpowered machine by most developers' definition). You don't need to spend a fortune to get started. Used Mac's capable of running High Sierra are readily available on eBay for $200-$500.

So, about High Sierra... your Mac will need macOS High Sierra installed. Due to license limitations in RubyMotion Starter (the free download), you must use the most recent version of Xcode, which requires High Sierra.

#### Ruby

Your Ruby can be the natively installed Ruby 2.3.x on macOS, or one you have independently installed via [Homebrew](https://brew.sh), [RVM](https://www.rvm.io) or [rbenv](https://github.com/rbenv/rbenv).  I recommend, for reasons that would require an entire blog post of their own, that you install a separate Ruby to use for your RubyMotion development.

Assuming you have one of the above (brew, rvm, rbenv) installed, you can install Ruby easily:

*Homebrew*  
```
brew install ruby
```  

*RVM*  
```
rvm install 2.4.4  
rvm use 2.4.4 --default
```

*rbenv*  
```
rbenv install 2.4.4
rbenv global 2.4.4
```

## Step 1: Install Xcode

It's an unfortunate fact of life that for any Apple/Mac/iOS development, you need to at least install [Xcode](https://developer.apple.com/xcode/).  There are a lot of extra development tools that are bundled within, and those are the things we need for RubyMotion development
  
### Xcode

You can download Xcode in two different ways.  I would recommend the App Store if you are just getting started.

#### App Store
Download Xcode (currently 9.4.1, but whichever is the most current) from the App Store (or go for the Developer Downloads).

After installation is complete, open it up and make sure it completed all the extra steps.  These extra steps include things like accepting license agreements, downloading command line tools, etc.

#### Apple Developer Downloads

- Download from Apple Developer Downloads
  - You’ll need an Apple Developer account to get this  
  [https://developer.apple.com/download](https://developer.apple.com/download)
  - Do NOT download any betas. For Starter edition, you need the *currently released* version of Xcode. 

> Note that you need about 15 GB of spare room to accommodate the xip’ed download and un-xiped Xcode.app

- Unzip 
  - should be done from Finder.  Trust me, you wouldn’t want to do it the other way.  
  - If you have more than one version of Xcode installed, rename this downloaded Xcode.app to Xcode-x.y.z.app (where x.y.z is the specific version of Xcode involved).
- Install
  - Move the .app to ~/Applications
  (To avoid interfering with App Store installed Xcode under /Applications, if you have different version)
  - Open up the ~/Applications/Xcode-x.y.z.app and make sure it completes whatever extra steps it requires.

For RubyMotion development, it is important for the Xcode command line tools and the iOS Simulator to be installed.

#### Command line tools

Open `Terminal.app` (or the terminal application of your choice) and check for the command line tools:

```bash
 $ xcode-select -p
 /Applications/Xcode.app/Contents/Developer
```

If you installed Xcode from the developer downloads, you can select that version to use:
 
```bash
sudo xcode-select -s ~/Applications/Xcode-x.y.z.app/Contents/Developer
```

To switch back to default App Store installed Xcode, you can run:
 
```bash
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
```

If you run into problems, it is sometimes necessary to run  

```bash
sudo xcode-select --reset
```

#### iOS Simulator

Open up Simulator.app, just to make sure it's working. I highly recommend you use Spotlight or Finder to find it, as it is deeply buried in the Xcode.app Contents directory.   

<div class="row">
  <div class="col-md-offset-2 col-lg-8">
    {% img img-responsive img-rounded /img/original/find-simulator.png title:"Find Simulator" %}
  </div>
</div>


You should be able to start the simulator, and see the simulated device start up in a default configuration like:


<div class="row">
  <div class="col-md-offset-2 col-lg-8">
    {% img img-responsive img-rounded /img/original/simulator.png title:"Simulator Running" %}
  </div>
</div>

## Step 2: Install RubyMotion

Download the RubyMotion Starter installer
[http://www.rubymotion.com/download/starter/](http://www.rubymotion.com/download/starter/)

- You’ll be asked for an email, so they can email your license key
- You need the license key to complete your installation

#### Install

- Run the installer app
- Have your license key handy

#### Configure

After RubyMotion is installed, you can check for updates, and ensure the application templates are installed/updated (stay tuned for a future post on RubyMotion templates).

From Terminal.app run:

```bash
sudo motion update
motion repo
```

At this point, RubyMotion should be installed and configured for use.

### Gems

Do whatever you normally do to segregate these gems in a gemset ([rbenv](https://github.com/jf/rbenv-gemset)/[rvm](https://rvm.io/gemsets/basics)/etc).  If you don’t know what that means, never mind, you’re good ;-).

Open up Terminal.app and type:

```bash
gem install bundler
```

If you run into problems installing any of the software or gems, please join our Slack discussion group - [Motioneers](https://motioneers.slack.com) for more detailed assistance.

[Join Motioneers here](http://motioneers.herokuapp.com)


## Step 3: Test Your Installation

After you get all the required software and gems installed, we test that everything works by building a default generated app with the `motion` command.  From Terminal.app, type:

```bash
$ motion create Hello
$ cd Hello
$ rake
```

This should build a default RubyMotion app, start the iOS Simulator, install the app on the simulator, and start the app.  Assuming all that worked, you will see something like the screen capture below.

<div class="row">
  <div class="col-md-offset-2 col-lg-8">
    {% img img-responsive img-rounded /img/original/test-app1.png title:"Find Simulator" %}
  </div>
</div>

## Wrapping up

You should now have a functional RubyMotion development environment.  To continue, I recommend that you check the [RubyMotion Samples](http://www.rubymotion.com/developers/samples) page as well as the [Sample Code Repository](https://github.com/HipByte/RubyMotionSamples) on GitHub.

If you ran into problems installing/configuring/testing any of the software above, please join the RubyMotion community on our Slack discussion group for more detailed assistance.

[Link to Join Motioneers](http://motioneers.herokuapp.com)  
[Motioneers Slack](https://motioneers.slack.com)
