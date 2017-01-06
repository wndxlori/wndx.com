---
layout: post
title: Ruby on Rails problems & solutions - Nov 29, 2010
categories: 
- web development
tags: []
status: publish
published: true
meta: {}
---

(Sorry, I'm a day late with this posting.  Busy, busy, with releases on two different projects due today)



As it turns out, today was all about Javascript.  <shrug>.  If you're a Rails developer, you gotta learn it sometime.



Dang hidden fields 



Apparently you can't can't trigger on-change events on hidden fields.  That's really annoying.  Don't bother looking, all you will find are endless discussions about why people want it, followed by abrupt ends when someone explains why it's a bad idea. I don't happen to agree with the notion that "they are saving me from myself".  :-P



Text overruns - Ellipsis not so easy



Who knew that it would be so difficult to get one of those "..." things working to indicate that the field is truncated.  I needed to do this on two text (name) columns on a table, so the whole thing would fit in the available width.



[http://mattsnider.com/css/css-string-truncation-with-ellipsis/](http://mattsnider.com/css/css-string-truncation-with-ellipsis/)



Click selector for tr



I wanted to be able to click on a row in the table, and "select" it, so that the page buttons (like "Edit) would then respond to the selected item.

[http://www.learningjquery.com/2008/12/quick-tip-click-table-row-to-trigger-a-checkbox-click](http://www.learningjquery.com/2008/12/quick-tip-click-table-row-to-trigger-a-checkbox-click)



(And no, I didn't want to implement jqGrid.  Too complex for my simple need)



jQuery replace (outerHTML)



Wow.  I didn't realize that the Prototype replace (outerHTML) function didn't actually have an equivalent in jQuery.  This one worked for me:

[http://brandonaaron.net/blog/2007/06/01/jquery-snippets-replace/](http://brandonaaron.net/blog/2007/06/01/jquery-snippets-replace/)
