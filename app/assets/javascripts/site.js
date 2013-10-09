$(document).ready(function(){

  $(window).bind('load', function() {
    $('.js-match-height').matchHeight();
  });

  $(window).resize(function() {
    var bodyWidth = $(document).width(),
    setOrUnset = (bodyWidth <= 768) ? 'unset' : 'set'
    $('.js-match-height').matchHeight(setOrUnset);
  });
});
