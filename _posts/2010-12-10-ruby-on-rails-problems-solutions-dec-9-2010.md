---
layout: post
title: Ruby on Rails problems & solutions, Dec 9, 2010
categories: 
- web development
tags: []
status: publish
published: true
meta: {}
---

responds_to_parent for Rails 3

This is the linchpin of the solution to Ajaxified file uploads, from my Dec 8 posting. 



[http://khamsouk.souvanlasy.com/articles/ajax-file-uploads-in-rails-using-attachment_fu-and-responds_to_parent](http://khamsouk.souvanlasy.com/articles/ajax-file-uploads-in-rails-using-attachment_fu-and-responds_to_parent)



And over to the Rails 3 project, and ....too bad it doesn't work on the Rails 3 project (aaaarrrrrgggghhhh)



[http://stackoverflow.com/questions/3882597/responds-to-parent-in-rails-3](http://stackoverflow.com/questions/3882597/responds-to-parent-in-rails-3)



But, wait, here's one (subtly different name) that does work...



[https://github.com/itkin/respond_to_parent](https://github.com/itkin/respond_to_parent)



Only....



respond_to_parent with jQuery



Seriously.  All the examples are Prototype.  All of 'em.  I did a lot of Googling, and didn't really find an answer.  So after a lot of trial and error, I came up with this one:



      format.js do 

        respond_to_parent do

          render :action => 'your_action.js.erb name here'

        end

      end





Capistrano and Paperclip uploads



But, but, I don't want my precious Excel files flapping out there in the wind (under public).



This link describes, in detail, how to update your attachments' url and path configuration, including how to get them out of public:



[http://thewebfellas.com/blog/2008/11/2/goodbye-attachment_fu-hello-paperclip](http://thewebfellas.com/blog/2008/11/2/goodbye-attachment_fu-hello-paperclip)



Although the following link still throws stuff under public, you can change those locations to the ones you selected above.  *And* it includes the Capistrano tasks for managing your uploads dir, *including* multistage support.  Priceless time saver.



[http://www.simonecarletti.com/blog/2009/02/capistrano-uploads-folder/](http://www.simonecarletti.com/blog/2009/02/capistrano-uploads-folder/)
