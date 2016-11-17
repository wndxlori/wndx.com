---
layout: post
title: Ruby on Rails problems & solutions - Jan 28, 2011
categories: 
- web development
tags: []
status: publish
type: post
published: true
meta: {}
---

jQuery combobox
Ever needed a combobox?  I mean a real one (ie, you can type into it AND select items)?  Here is an excellent blog, explaining the finer details of how it works:
[http://www.learningjquery.com/2010/06/a-jquery-ui-combobox-under-the-hood](http://www.learningjquery.com/2010/06/a-jquery-ui-combobox-under-the-hood)

And, then, when you put it in a form, and it doesn't work, you'll need this:

[http://forum.jquery.com/topic/autocomplete-combobox-problem-when-it-is-placed-inside-a-form-tag](http://forum.jquery.com/topic/autocomplete-combobox-problem-when-it-is-placed-inside-a-form-tag)

Form with nested resources



I don't do this very often, and I hadn't used form_for with nested resources before.  It seems this doesn't work:



form_for @post, @comment



But this does:

form_for [@post, @comment]  



D'Oh!  That one took me a while to find.  The example from this link pointed me in the right direction:

[http://apidock.com/rails/ActionView/Helpers/FormHelper/form_for](http://apidock.com/rails/ActionView/Helpers/FormHelper/form_for)

jQuery again - val() on a hidden select doesn't work

Ok, this is really fucking annoying.  How is anyone supposed to figure out that this doesn't work when the select is hidden:



$("myselect").val()



But this does:



$("myselect option:selected").val()



Do you know how many hours that cost me?!?!?!?  P.S.  If you are using the combobox (above) this may be important to you.
