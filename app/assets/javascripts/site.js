$(document).ready(function(){
  // Extremely rough draft top nav functionality

  $('#learn').hover(function(e) {
    $('.top-nav-links').hide();
    $('#learn-sub-nav').show();

    $('.header-nav li').removeClass('alive');
    $('.top-nav ul').removeClass('alive');
    $('#learn').addClass('alive');
    $('#learn-sub-nav').addClass('alive');
  })
  $('#volunteer').hover(function(e) {
    $('.top-nav-links').hide();
    $('#volunteer-sub-nav').show();

    $('.header-nav li').removeClass('alive');
    $('.top-nav ul').removeClass('alive');
    $('#volunteer').addClass('alive');
    $('#volunteer-sub-nav').addClass('alive');

  })
  $('#about').hover(function(e) {
    $('.top-nav-links').hide();
    $('#about-sub-nav').show();

    $('.header-nav li').removeClass('alive');
    $('.top-nav ul').removeClass('alive');
    $('#about').addClass('alive');
    $('#about-sub-nav').addClass('alive');
  })

  $('#blog').hover(function(e) {
    $('.top-nav-links').hide();
    $('.top-nav-links li').removeClass('alive');
    $('.header-nav li').removeClass('alive');
  })

  $('#curriculum').hover(function(e) {
    $('.top-nav-links').hide();
    $('.header-nav li').removeClass('alive');
  })

  $('ul.header-nav').mouseout(function(e) {
    console.log($('.top-nav-container:hover').length)
    if ($('.top-nav-container:hover').length === 0) {
      $('.top-nav-links').hide();
      $('.header-nav li').removeClass('alive');
      $('.top-nav .selected').show();
    }
  })

});
