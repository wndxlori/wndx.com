---
layout: post
title: My weekend Windows experience, or why I love Apple so much
categories: 
- business
tags:
- installer
- mac
- nightmare
- webcam
- windows
status: publish
type: post
published: true
meta: {}
--->Filed under: 
[Humor](http://www.tuaw.com/2010/05/24/my-weekend-windows-experience-or-why-i-love-apple-so-much#)

###[My weekend Windows experience, or why I love Apple so much](http://www.tuaw.com/2010/05/24/my-weekend-windows-experience-or-why-i-love-apple-so-much/)


by 
**[Steven Sande](http://www.tuaw.com/2010/05/24/my-weekend-windows-experience-or-why-i-love-apple-so-much#)**
 
(
[RSS feed](http://www.tuaw.com/2010/05/24/my-weekend-windows-experience-or-why-i-love-apple-so-much#)) on May 24th 2010 at 3:00PM

![](http://www.blogcdn.com/www.tuaw.com/media/2010/05/steve-ballmer-is-toying-with-me.jpg)
I'm really happy that 
[Apple is once again talking about why people will love the Mac](http://www.tuaw.com/2010/05/21/apples-new-campaign-why-youll-love-a-mac/) when they finally escape from Windows. I had an experience over the last few days that reinforced my love affair with the Mac. Since many of you are also Mac fanatics, I thought you'd love to hear the step-by-step, agonizing situation I endured. 
All I wanted to do was install a Wi-Fi remote-controlled webcam. Nothing spectacular. I had looked at a number of webcams on Amazon.com before settling on a rather inexpensive Chinese-made device. According to the vendor, the camera was "Apple Mac and Windows compatible," so I ordered it. It arrived quickly, and a glance at the manual revealed that I would need to use Windows to set up the camera prior to using it with an "Apple Mac." Since I always keep a copy of Windows Vista Ultimate running under 
[VMWare Fusion](http://www.vmware.com/products/fusion/) for such emergencies, I felt this would be a quick process.

Yeah, right.

Fortunately for you, I've documented the installation procedure for posterity. Now you can enjoy my own personal vision of Hell. It's called using Windows.

1) Screw antenna into base of webcam at 6:55PM. This is going to be fun!


2) Plug in power supply. Camera moves for a bit, then settles down.


3) Fire up Windows, then realize that I can't use the camera software install CD since it's one of those mini ones that were so popular in 1998. They don't work in slot-type SuperDrives. Need to download the software from vendor's website.


4) Start up IE7 in Windows.


5) Can't get to downloads page from IE7 so download and install Firefox.


6) Go to vendor site, get to the downloads page. Can't download the software until I download and install the Flash plug-in.


7) Install Flash Player.


8) Download the software, finally. It's an .rar archive.


9) Windows has no idea what an rar file is. I have it "use the Web service to find the correct program." I find out that WinZip or StuffIt Expander will work. 


10) Realize that WinZip is a program that, with all the add-INS, will cost me almost US$37. Didn't it used to be free? 


11) Go to StuffIt site and download free StuffIt Expander. Wait while McAfee scans for viruses.


12) Install StuffIt Expander. "This may take several minutes" it says.


13) Installation continues for an incredibly long time, most of which is marked by a status message that doesn't change. Considering taking up smoking. Read 
[War and Peace](http://en.wikipedia.org/wiki/War_and_peace) cover to cover while waiting for installation to complete, then build a 1:1 scale model of 
[La Sagreda Familia](http://en.wikipedia.org/wiki/La_Sagrada_Familia) out of toothpicks. About to perform a self-appendectomy when the installation finally finishes. Put away the X-acto knife and vodka.


14) Trying to reinstall StuffIt when Windows tells me in needs to activate. That's perplexing since I installed and activated this legal copy of Windows Vista Ultimate weeks ago. Decide to at least try reinstalling StuffIt before going through activation again. 


15) StuffIt Expander installer won't run since it says that there's already another installation in progress. System monitor shows no other application is running. 


16) Restart Windows. Or at least try to. It takes forever to shut down. Finally Force Quit VMWare and hope for the best.


17) Re-launch VMWare, which unfortunately comes up in Windows shutdown mode. Finally find the Shut Down command in VMWare, then restart Windows Vista. It's now 7:55 PM. Windows Vista plays its 4-tone startup tune, which I salute with two raised middle fingers.


18) Start up the StuffIt Expander installer again. Get an error message. Re-download the installer and try again, this time sacrificing a chicken while starting the installer. The installer takes its good time, but finally shows a completed installation. I feel sorry for the chicken, but happy that StuffIt Expander is installed.


19) What was I doing before all of this? Oh, yeah - I was trying to unzip the webcam installer. This goes well until the unzip crashes. I see the installer on my desktop, so I double-click to install. This installer runs quickly, but I need to reboot the Windows virtual machine. 


20) Weeping uncontrollably, I wait as the virtual machine lies to me about shutting down. It's now 8:09 PM. I wait, and wait. Did I mention the waiting? 


21) I'm so bloody tired of waiting for the shutdown that I invoke the Shutdown menu item again. Windows reboots again.


22) Double-click the webcam software. After I nearly have a heart attack when it temporarily can't find the .exe file, it launches. This program is supposed to find a camera on the network and allow me to change settings. It's doing nothing, so I decide to start pinging addresses on my network from Safari. I find my printer's built-in web server, but not the webcam.


23) While I'm playing on the Mac, Windows mysteriously reboots itself. WTF?


24) I figure out that Windows thinks it is on another subnet. I look at some of the glowing reviews on Amazon and see the key phrase "connect to the camera over Ethernet the first time." Nice of the vendor to put that in the docs. I'm tired. It's now 8:58 PM. I decide to try this tomorrow on my old iMac since I have work to do. I'll set up a small Ethernet network using a router I have, and hope that I can get this to work. 



*Time passes*

25) It's now the next afternoon. I set up the old Linksys router, grab a few Ethernet cables, and fire up the camera app on the old iMac under VMWare and Win XP. Not surprisingly, Win XP works much better than Vista and within about 5 minutes I'm seeing the camera "anonymous" in the camera app. 


27) Reading the tiny print in the poorly-translated user manual for the webcam, I see that the vendor recommends using IE to bring up the built-in administrative web page and set up Wi-Fi. I double-click the name of the camera, and I'm immediately rewarded with a login screen for the admin web page. I log in using the default user ID and password, and then watch as IE7 proceeds to block the various controls that are trying to load. 


28) At this point I'm discouraged and shouting four and more-letter expletives at IE7. I decide that it's time to grab my spouse and go out to eat (and drink) away my frustration. A few beers later we're back home and I download Firefox onto the virtual Win machine.


29) I launch Firefox, go to the IP address of the camera, and become very happy when the camera controller loads properly and responds to my commands. 


30) With the webcam finally up and running, I tell Windows XP to quit. Soon I'm greeted with a happy message that says something like "Windows is installing update 1 of 37. Do not shut down this machine." I wander off.


31) 
Two hours later, the message says "Windows is installing update 31 of 37." I may never get to shut down Windows.


32) Another hour passes. The message hasn't changed. I decide that Windows XP has locked up, and I invoke the magic VMWare virtual power switch. Who knows if the flippin' thing was updated or not?

OK, a lot of this probably could have been avoided had I waited until Sunday, when I received an email from the Amazon vendor that I purchased the camera from. It included the magic words "If you have an Apple Mac, please give us a call and we'll walk you through the installation." I almost started banging my head on the table when I saw that phrase.

But the point of this entire exercise was that if Apple had ever stooped to selling Wi-Fi webcams, the installation process would probably be like this:

1) Plug your Apple iCam into a wall socket. 


2) Launch the iCam utility software on your Mac or Windows PC. It's included on the CD that came with your device.


3) Your iCam appears in the "cameras on this network" list. Highlight the camera you wish to update.


4) Give the camera a name, and click save. Note the web address that is now listed on the page -- this address is where you can point any web browser in the world to view your camera and listen to what's going on in streaming stereo audio.

I'm sure I'll have some comments along the lines of "Well, if you had some familiarity with Windows, you'd realize that..." I 
amfamiliar with Windows. Way too familiar, as at one point in my career I was a project manager on a 12,000-seat Windows deployment for a large enterprise. Since that time, I've had my share of Windows experiences with my Mac consulting clients who have one Windows device on their network that ends up taking more support hours to keep up and running than the dozen or so Macs in the office.

And I'm certain that someone will say "A real PC wouldn't have done that; you're running a virtual machine on a slow Mac." Wrong, this type of thing has happened to me many times on real PCs as well. This isn't a slow Mac; it's a quad-core i7 iMac running 64-bit Windows Vista Ultimate.

To be perfectly fair, I think that Microsoft has done a much better job with Windows 7 than with any previous version. Of course, that's the same version of Windows that now looks surprisingly similar to Mac OS X, complete with a Dock at the bottom of the screen.

Make mine Mac.

**Tags:**
 
[windows](http://www.tuaw.com/tag/windows/), 
[windows vista](http://www.tuaw.com/tag/windows+vista/), 
[windows xp](http://www.tuaw.com/tag/windows+xp/), 
[WindowsVista](http://www.tuaw.com/tag/WindowsVista/), 
[WindowsXp](http://www.tuaw.com/tag/WindowsXp/)

*[Source](http://www.tuaw.com/tag/windows)


*[Print this
With HP wireless printers,

 you could have printed

 this from any room

 in the house.

**Live wirelessly. Print wirelessly**](http://www.tuaw.com/2010/05/24/my-weekend-windows-experience-or-why-i-love-apple-so-much/print/)


*[Email this](http://www.tuaw.com/2010/05/24/my-weekend-windows-experience-or-why-i-love-apple-so-much#)


*[Share](http://www.addthis.com/bookmark.php)


*[http://www.tuaw.com/2010/05/24/my-weekend-windows-experience-or-why-i-love-ap...](http://twitter.com/home?source=tuaw.com&status=From%20@tuaw:%20%3Ca%20href=)">Tweet this!


*[Comments (
127)](http://www.tuaw.com/2010/05/24/my-weekend-windows-experience-or-why-i-love-apple-so-much/#comments)


via 
[tuaw.com](http://www.tuaw.com/2010/05/24/my-weekend-windows-experience-or-why-i-love-apple-so-much/)
    
Just in case I needed to be reminded of why I'm a Mac user these days.
