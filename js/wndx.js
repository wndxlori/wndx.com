//
// On click, adds a virtual page view for Google Analytics tracking
// to each of the social media share links
//

$(function() {
    $('ul.social-buttons a').on('click', function() {
        // Get the classes off the i child element of $anchor for the actual social network
        // var $anchor = $(this);
        ga('send', 'pageview', '/vpv/social');
    });
});