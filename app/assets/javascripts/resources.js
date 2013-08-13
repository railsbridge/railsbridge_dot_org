$(document).ready(function(){
  function updateNav(that) {
    $('#learning-resources-nav .nav').children().removeClass("active")
    $(that).addClass("active");
  }

  function showSection(that) {
    $(".learning-resources").children().hide();
    section = $(that).children().attr("href");
    $(section).show();
  }

 $('#learning-resources-nav .nav-tabs').on('click', 'li', function(e) {
  e.preventDefault();
  updateNav(this);
  showSection(this);
 });
});
