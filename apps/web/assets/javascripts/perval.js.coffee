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
      $(section).css('background-position','50% '+parseInt(offset-x*0.20)+'px')

  $('form').ajaxForm
    beforeSubmit: ->
      $('form .actions input').hide()
      spinner.spin($('.spinner-container')[0])
    complete: ->
      spinner.stop()
    success: ->
      $('form .success-message').show()
      $(".fields").collapse('hide')
    error: ->
      $('form .error-message').show()

spinner = new Spinner(
  lines: 11
  length: 7
  width: 4
  radius: 10
  scale: 1
  corners: 1
  color: '#FFF'
  opacity: 0.25
  rotate: 0
  direction: 1
  speed: 1
  trail: 60
  fps: 20
  zIndex: 2e9
  className: 'spinner'
  top: '30px'
  left: '50%'
  shadow: false
  hwaccel: false
  position: 'relative'
)


$(document).ready ->
  $("a").on 'click', (event) ->
    if this.hash != ""
      event.preventDefault()
      hash = this.hash
      $('html, body').animate({
        scrollTop: $(hash).offset().top - 50
      }, 800, ->
        window.location.hash = hash
      )
