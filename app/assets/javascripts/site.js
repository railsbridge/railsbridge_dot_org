$(document).ready(function(){
  // Extremely rough draft top nav functionality

  $('#learn').hover(function(e) {
    $('.top_nav_links').hide();
    $('#learning_sub_nav').show();

    $('.header_nav li').removeClass('alive');
    $('.top_nav ul').removeClass('alive');
    $('#learning').addClass('alive');
    $('#learning_sub_nav').addClass('alive');
  })
  $('#volunteer').hover(function(e) {
    $('.top_nav_links').hide();
    $('#helping_sub_nav').show();

    $('.header_nav li').removeClass('alive');
    $('.top_nav ul').removeClass('alive');
    $('#helping').addClass('alive');
    $('#helping_sub_nav').addClass('alive');

  })
  $('#about').hover(function(e) {
    $('.top_nav_links').hide();
    $('#about_sub_nav').show();

    $('.header_nav li').removeClass('alive');
    $('.top_nav ul').removeClass('alive');
    $('#about').addClass('alive');
    $('#about_sub_nav').addClass('alive');
  })

  $('#blog').hover(function(e) {
    $('.top_nav_links').hide();
    $('.top_nav_links li').removeClass('alive');
    $('.header_nav li').removeClass('alive');
  })

  $('#curriculum').hover(function(e) {
    $('.top_nav_links').hide();
    $('.header_nav li').removeClass('alive');
  })

  $('ul.header_nav').mouseout(function(e) {
    console.log($('.top_nav_container:hover').length)
    if ($('.top_nav_container:hover').length === 0) {
      $('.top_nav_links').hide();
      $('.header_nav li').removeClass('alive');
      $('.top_nav .selected').show();
    }
  })

});
