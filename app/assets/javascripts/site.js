$(document).ready(function(){
  // Extremely rough draft top nav functionality

  $('#learn').hover(function(e) {
    reset();
    $('#js-learn-sub-nav').show().addClass('alive');
    $('#learn').addClass('alive');
  })

  $('#volunteer').hover(function(e) {
    reset();
    $('#js-volunteer-sub-nav').show().addClass('alive');
    $('#volunteer').addClass('alive');
  })

  $('#about').hover(function(e) {
    reset();
    $('#js-about-sub-nav').show().addClass('alive');
    $('#about').addClass('alive');
  })

  $('#blog').hover(function(e) {
    reset();
  })

  $('#curriculum').hover(function(e) {
    reset();
  })

  function reset() {
    $('.header-nav li').removeClass('alive');
    $('.top-nav ul').removeClass('alive');
    $('.top-nav-links').hide();
  }
});
