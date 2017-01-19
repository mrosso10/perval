update_home_height = ->
  $("#welcome").css('height', $(window).height())

update_navbar_visibility = ->
  if $('body').scrollTop() > 0
    $('header').fadeIn()
  else
    $('header').fadeOut()

$(document).scroll update_navbar_visibility
$(window).resize update_home_height

$(document).ready ->
  update_home_height()

  $('header').hide()

  $('.fadeIn').animate({
    opacity: 1,
  }, 1000);

$(document).scroll ->
  x = $('body').scrollTop()
  console.log(x)
  $("#welcome").css('background-position','50% '+parseInt(0 + x/10)+'%')
