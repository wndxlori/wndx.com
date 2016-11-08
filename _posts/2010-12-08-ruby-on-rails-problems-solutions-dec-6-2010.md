---
layout: post
title: Ruby on Rails problems & solutions - Dec 6, 2010
categories: []
tags: []
status: publish
type: post
published: true
meta: {}
---

Git delete last commit.  Enough said.



[http://nakkaya.com/2009/09/24/git-delete-last-commit/](http://nakkaya.com/2009/09/24/git-delete-last-commit/) 


Getting Roo working under Rails 3



Something of a challenge, actually.  The gem doesn't list it's dependencies properly, so we have to "guess".  This got me started:



[http://www.eggheadcafe.com/software/aspnet/35719402/using-roo-to-avoid-need-f...](http://www.eggheadcafe.com/software/aspnet/35719402/using-roo-to-avoid-need-for-excel-to-be-installed.aspx)



From the comments, use rubyzip2, instead of 
febeling-rubyzip. Bundler should pick up the rest of the gems not identified by this post. <Grumble, growl, SNAP>



Using Roo



[http://rubyonwindows.blogspot.com/2008/01/parsing-spreadsheets-with-roo-gem.html](http://rubyonwindows.blogspot.com/2008/01/parsing-spreadsheets-with-roo-gem.html)



No, no, never mind.  Don't use Roo



2 minutes?!?! just to open the file?!?!? I can use rubyzip2 and nokogiri to



1. Open the xlsm file (zipped archive)

2. Pull out the xl/worksheet.xml file

3. Search for the definitions for the 3 values I want to read

4. Parse out the sheet locations for those defined values

5. Open those sheets and read the required values



Ok, so you need to learn the Zip::ZipFileSystem API (actually, very simple).  And then you need to use Nokogiri, and some selectors (if XPath doesn't turn your crank, then use the CSS selector).  Considerably less than 2 minutes, and I don't have to bundle Spreadsheet gem, which has one of the stupidest licenses on earth.



require 'zip/zipfilesystem'

require 'nokogiri' zip = Zip::ZipFile.open("some_excel_file.xlsm")

workbook = Nokogiri::XML(zip.read('xl/workbook.xml'))

location = workbook.css('definedNames definedName[@name = "intLPGTotal"]').last.child.content



I think you can see where I am going here.  Roo is undoubtly a great tool, but in my case, it was a sledgehammer, and I needed tweezers.





(Apologies.  This was a grumpy sort of day)
