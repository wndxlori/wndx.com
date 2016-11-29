You will need to install [PhantomJS](http://phantomjs.org/index.html).  The currently recommended way of installing is via HomeBrew:

`brew update && brew install phantomjs`

At that point, if you have bundle-installed all the Client Portal gems, you should be good to start running the Javascript tests.

These are the gems we used to set up:

```
gem 'jasmine'
gem 'jasmine-phantom'
gem 'jasmine-jquery-rails'
```  

And these are the rake tasks you get:

```
rake jasmine             # Run specs via server
rake jasmine:ci          # Run continuous integration tests
rake jasmine:phantom:ci  # Run jasmine specs using phantomjs and report the results
```

1. `rake jasmine:phantom:ci`
This is the one that is integrated into the "default" rake task, and the Jenkins build, and runs after the RSpec specs run.  It runs headless (i.e. at the command-line, not in a browser), using PhantomJS.  
 
2. `rake jasmine:ci`
This one runs in Selenium (Firefox).  Since we are using PhantomJS for our CI build, I can't really see a lot of value in using this task, other than it runs in Firefox.

3. `rake jasmine`
This sets up it's own web server, using Thin, on port 8888.  Going to [http://localhost:8888/](http://localhost:8888/) will run the test suite.  This is what I would expect you to do, day-to-day, if you were actively working on Javascript and Jasmine testing. It runs in the browser, so you can use your browser debugging tools to assist.

## Jasmine

Jasmine has excellent documentation, found [here](http://pivotal.github.com/jasmine/). I suggest you bookmark that one, if you plan to be doing much Javascript work.

## Jasmine-JQuery

jasmine-jquery is a nice little gem providing a nice set of custom matchers for jQuery, and an API for handling HTML fixtures in your specs. The main [Github page](https://github.com/velesin/jasmine-jquery) has most of the documentation you will need for this. Another good one to bookmark.

## More Resources

Diaspora was pointed out as a [specific](https://github.com/diaspora/diaspora/tree/master/spec/javascripts) source of good Jasmine testing examples.