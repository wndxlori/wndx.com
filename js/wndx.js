//
// On click, adds a virtual page view for Google Analytics tracking
// to each of the social media share links
//

$(function () {
  $('ul.social-buttons a').on('click', function () {
    // Get the classes off the i child element of $anchor for the actual social network
    // var $anchor = $(this);
    ga('send', 'pageview', '/vpv/social');
  });

  if (window.location.hash) {
    var hash = window.location.hash.substring(1);
    if (hash == "coredatathanks") {
      $(document).trigger("add-alerts", [
        {
          "message": "Here is some additional RubyMotion content I hope you find useful.",
          "priority": 'info'
        }
      ]);
    }
  }
});