---
layout: post
title: Ruby on Rails problems & solutions, Dec 7, 2010
categories: 
- web development
tags: []
status: publish
type: post
published: true
meta: {}
---

openjdk-6-jre-headless install/updates hang on AWS micro instance



[https://bugs.launchpad.net/ubuntu/+source/linux-ec2/+bug/634487](https://bugs.launchpad.net/ubuntu/+source/linux-ec2/+bug/634487)



This JRE is required for the AWS ec2 tools.  Isn't that special.  Ergo, AWS micro instance is currently useless for any automated deployments.  AWS small, here we come.



Haversine formula for Ruby



I'm sure some of you are scratching your heads, thinking "Haversine" ?  Distance (great circle) between 2 lat/long locations.  I'm using a database that GeoKit doesn't support (Oracle), and I don't have access to the SDO indices, so...



[http://www.esawdust.com/blog/gps/files/HaversineFormulaInRuby.html](http://www.esawdust.com/blog/gps/files/HaversineFormulaInRuby.html)



And then my personal fav of the day:



Ajax File Uploads... fugetaboutit!



Ok, the rest of you probably knew this, but I didn't.  For security reasons, Javascript doesn't have access to your file input fields.  This means you can't include them in a remote form.  Arrrrgggghhhh!  The hunt for a solution led us thru these options.



[http://www.ruby-forum.com/topic/137861](http://www.ruby-forum.com/topic/137861)

[http://khamsouk.souvanlasy.com/articles/ajax-file-uploads-in-rails-using-attachment_fu-and-responds_to_parent](http://khamsouk.souvanlasy.com/articles/ajax-file-uploads-in-rails-using-attachment_fu-and-responds_to_parent)

[http://kpumuk.info/ruby-on-rails/in-place-file-upload-with-ruby-on-rails/](http://kpumuk.info/ruby-on-rails/in-place-file-upload-with-ruby-on-rails/)
