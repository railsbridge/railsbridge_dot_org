$(document).ready(function(){
  // header and top nav functionality aka the arrows
  // header -> ul.header_nav -> li & top_nav -> ul.top_nav_links -> li
  // header_nav and top_nav are connected by ids, eg: ul.header_nav li#learning -> top_nav ul#learning_sub_nav
  // li.main_nav and ul.top_nav_links states are alive -> hover and selected -> set on page load
  // li.main_nav span is nav arrow which is darker when in selected state
  
  // show appropriate top_nav on page load by setting .top_nav_current which only changes with page reload
  // show appropriate top_nav for hover state with 
  
  $('#learning').hover(function(e) {
    $('.top_nav_links').hide();
    $('#learning_sub_nav').show();

    $('.header_nav li').removeClass('alive');
    $('.top_nav ul').removeClass('alive');
    $('#learning').addClass('alive');
    $('#learning_sub_nav').addClass('alive');
  })
  $('#helping').hover(function(e) {
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

  // $('.top_nav_links').mouseout(function(e) {
  //   if ($('.header_nav:hover').length === 0) { 
  //     $('.top_nav_links').hide();
  //     $('.header_nav li').removeClass('alive');
  //     $('.top_nav .selected').show();
  //   }
  // })

});
