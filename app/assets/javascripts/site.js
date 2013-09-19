$(document).ready(function(){

  // Serious TODO: clean this up/turn into plugin
  matchHeight();

  function thisHeight() {
    return $(this).height();
  }

  function matchHeight(setOrRemove) {
    setOrRemove = typeof setOrRemove !== 'undefined' ? setOrRemove : 'set'
    $.each($('.js-match-height'), function( index, value ) {
      var features = $(this).find('.feature');
      if (setOrRemove === 'set') {
        var maxHeight = Math.max.apply(Math, features.map(thisHeight));
      } else {
        var maxHeight = ''
      }
      features.css({
        'height': maxHeight
      })
    });
  }

  $(window).resize(function() {
    var bodyWidth = $(document).width();
    if (bodyWidth <= 768) {
      matchHeight('unset');
    } else {
      matchHeight();
    }
  });
});
