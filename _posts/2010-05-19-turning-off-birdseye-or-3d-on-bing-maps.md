---
layout: post
title: Turning off BirdsEye (or 3D) on Bing Maps
categories: []
tags:
- 3d
- bing
- birdseye
- disable
- maps
status: publish
type: post
published: true
meta: {}
--->###You searched for 'vemapoptions example'


Here are some results for the search term on this website

*[Introduction to the SQL Server 2008 HIERARCHYID data type](http://magmainteractive.net/weblogs/post/Introduction-to-the-SQL-Server-2008-HIERARCHYID-data-type.aspx)


*[Virtual Earth 6.1: Map Options and Importing Google KML](http://magmainteractive.net/weblogs/post/Virtual-Earth-61-Map-Options-and-Importing-Google-KML.aspx)


*[Client-side validation with AJAX](http://magmainteractive.net/weblogs/post/Client-side-validation-with-AJAX.aspx)
                
  
  
  
  


#[Virtual Earth 6.1: Map Options and Importing Google KML](http://magmainteractive.net/weblogs/post/Virtual-Earth-61-Map-Options-and-Importing-Google-KML.aspx)

        
![clock](http://magmainteractive.net/weblogs/post/Virtual-Earth-61-Map-Options-and-Importing-Google-KML.aspx/../themes/MI/img/timeicon.gif) April 16, 2008 03:33 by 
[Matthew Ellis](http://magmainteractive.net/weblogs/author/Matthew%20Ellis.aspx)
        
I finally got around to taking a look at the SDK docs for Virtual Earth 6.1 and the feature list continues to grow and continues to impress, however rather than just dumping a list of new features, I’m going to write a few samples to demonstrate the new features. 
##New Map Options
 
First and foremost, the VEMap.LoadMap() method has slightly changed and includes the parameter mapOptions, which allows for greater customization of the map control. This property is of type VEMapOptions and implements the following properties: 
*EnableBirdseye: A Boolean property used to indicate whether Birdseye is available. If set to false the Birdseye map icon will be absent from the control.


*EnableDashboardLabels: A Boolean property used to indicate whether or not labels appear on the map when a user clicks the Aerial or Birdseye map style buttons on the map control dashboard. 
The code below demonstrates how this parameter can be specified when defining a new map, note that no other parameters of the VEMap.LoadMap() method are specified, thus we should set their value to null, unless of course we wish to define the other properties. 
<script type="text/javascript" src="http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6.1"></script>
<script type="text/javascript">
    function loadMap()
    {
        var map = new VEMap('veMap');
        
        var options = new VEMapOptions();
        options.EnableBirdseye = false;
        options.EnableDashboardLabels = false;
        
        map.LoadMap(null, null, null, null, null, null, null, options);
    }
</script>



via 
[magmainteractive.net](http://magmainteractive.net/weblogs/post/Virtual-Earth-61-Map-Options-and-Importing-Google-KML.aspx)
    
Took me a surprising amount of time to find the code that *just* turns off BirdsEye for Bing Maps.  Reposting to get higher visibility for the next poor sucker who goes Googling.  (Yes, you are a verb, Google.  Tough!)
