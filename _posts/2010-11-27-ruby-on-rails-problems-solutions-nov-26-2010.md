---
layout: post
title: Ruby on Rails problems & solutions - Nov 26, 2010
categories: 
- web development
tags: []
status: publish
published: true
meta: {}
---

jQuery ajax requests & Firebug console logging

Coordinating development with our "front-end" person, we ran into an interesting problem today.  I really haven't developed an exclusively ajax app before, so the full range of front-end Javascript interactions was new to me.  Ran into a problem, with jQuery and a response to a remote form submit.  Specifically, on the error handler.



Some strangeness I found when I looked for answer:



[http://stackoverflow.com/questions/3620205/jquery-and-rails-3-ajaxfailure-callback](http://stackoverflow.com/questions/3620205/jquery-and-rails-3-ajaxfailure-callback)



But, that wasn't it.  The simple fact is, Firebug failed us, in 2 different ways (Mac & Linux).  It seems trying to dump the entire xhr contents on the error handler fails when you try to access xhr.channel.  Fails silently and mysteriously on Linux, and fails in ways that sometime block the console log completely on the Mac.  Frustrating.  Note that your status will appear in xhr.status, and your errors in xhr.responseText, if your action response looks like:



format.js  { render :json => @job.errors, :status => :unprocessable_entity }



And your failure binding looks like:



f.bind('ajax:failure', jobSavedFailure);

var jobSavedFailure = function(event, xhr, status, error) {...}



Will_paginate with Rails 3



Couple of things about using will_paginate with Rails 3.  



Remote pagination links (awesome):



[http://www.tricksonrails.com/2010/04/rails3-and-will_paginate-doing-easy-remote-links-rails3-tricks-02/](http://www.tricksonrails.com/2010/04/rails3-and-will_paginate-doing-easy-remote-links-rails3-tricks-02/)



And, as long as you are using the rails3 branch, scopes should "just work" (Model.scope.paginate), and you won't have to go thru contortions like this link suggests:



[http://stackoverflow.com/questions/2792119/will-paginate-with-named-scopes](http://stackoverflow.com/questions/2792119/will-paginate-with-named-scopes)



Resizable table columns



Of course, when I suggested limiting the number of columns in our table, due to width constraints, our project manager decided he wanted resizable columns instead.  If you are using jQuery, I suggest this plugin:



[http://www.2dconcept.com/jquery-grid-rails-plugin](http://www.2dconcept.com/jquery-grid-rails-plugin)
