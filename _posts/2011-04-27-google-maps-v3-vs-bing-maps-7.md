---
layout: post
title: Google Maps V3 vs Bing Maps 7
categories: 
- web development
tags: []
status: publish
type: post
published: true
meta: {}
---

I really, really hate poorly contrived performance comparisons, which proliferate *everywhere*, with bad data.



Case in point.  The new Bing Map 7's  claim to fame (along with a completely changed API) is a performance boost of over 300% from Bing Map 6.3.  Now, that's a great improvement, and I'm happy to see it.  However, when someone starts to compare it to Google Maps V3 performance, using a poorly implemented example, I have to take exception.



[http://www.earthware.co.uk/blog/index.php/2011/02/ajax-mapping-apis-google-maps-vs-bing-maps-update-pushpin-display-performance/comment-page-1/#comment-7982](http://www.earthware.co.uk/blog/index.php/2011/02/ajax-mapping-apis-google-maps-vs-bing-maps-update-pushpin-display-performance/comment-page-1/#comment-7982)



Look at those examples for adding 1000 markers.  Outrageous.  Look how slow Google Maps is!  Or is it?  Anyone who actually uses Google Maps API to add many markers to a map, knows that you should be using MarkerManager.



[http://google-maps-utility-library-v3.googlecode.com/svn/tags/markermanager/1.0/docs/examples.html](http://google-maps-utility-library-v3.googlecode.com/svn/tags/markermanager/1.0/docs/examples.html)



If you download the examples from Earthware, and add a MarkerManager to the Google Maps V3 version, suddenly the Google Maps version totally outperforms Bing Maps.  Surprise.



<script type="text/javascript"

src="markermanager.js"

</script>



var markers = [];

        for (i = 0; i < num; i++) {

            var marker = new google.maps.Marker({

                position: new google.maps.LatLng(southWest.lat() + latSpan * Math.random(), southWest.lng() + lngSpan * Math.random())

            });

            markers.push(marker);

        }



mgr = new MarkerManager(map);

google.maps.event.addListener(mgr, 'loaded', function(){

mgr.addMarkers(markers,5);

mgr.refresh();

});





Don't ever take anyone's blog as gospel truth.  Use your brain, and test it yourself.
