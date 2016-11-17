---
layout: post
title: Ruby on Rails problems & solutions - Feb 23, 2011
categories: 
- web development
tags: []
status: publish
type: post
published: true
meta: {}
---

Handle divide by zero in select in OracleActually, I could do an entire blog entry, or even an conference session on the topic of avoiding the N+1 query problem when displaying data from legacy databases.  Only in my case, it's more like 7N+1.  But, let's just get down to today's specific case.  I needed to display a table of values, and I wanted to be able to sort the table on 
any of the columns.  Sorting is most efficiently done by the database, no?  But several of the columns were actually derived data, with simple calculations.  You can still sort on such things, IF you create a custom column aka - "SELECT cola/colb as custom_column FROM ...".  Unfortunately, if colb contains any zeros, the query will blow up.  :-p


There are a couple of solutions, but my fav - nullif to the rescue:

[http://forums.oracle.com/forums/thread.jspa?threadID=1556158&tstart=-2](http://forums.oracle.com/forums/thread.jspa?threadID=1556158&tstart=-2)

Ruby strftime codes



Found myself needing this in two different projects today, for 2 different kinds of formatting dates and times.  So I have to give it the nod

[http://www.datatravels.com/technotes/2009/11/16/ruby-date-time-format-codes-for-the-strftime-meth/](http://www.datatravels.com/technotes/2009/11/16/ruby-date-time-format-codes-for-the-strftime-meth/)

Acl9 and time limited comment editing

[http://speakmy.name/2009/01/using-acl9-for-easy-object-based-access-control/](http://speakmy.name/2009/01/using-acl9-for-easy-object-based-access-control/)

The above link is a great example of using acl9 authorization to do something non-trivial.  Unfortunately, it's implemented... wrong.  The good part is that the specs provided actually fail.  The bad part is the time it takes to figure out the error is actually a logical error in the code, and not some transcription error you made when you tried it out yourself.

The implementation of is_owner? is logically... wrong, but the test is correct.

(P.S. I know I've gotten behind on this. Take the "today" mentions with a grain of salt. I am still collecting these snippets every week, and I have quite a back-log to work thru)
