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

  $(".sliding-background").each (index, section) ->
    offset = parseInt($(section).attr('data-offset'))
    offset = 0 unless offset > 0
    $(document).scroll ->
      x = $(this).scrollTop()
      $(section).css('background-position','50% '+parseInt(offset-x*1.3)+'px')
