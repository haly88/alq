ready = ->
	$('.spinner').hide()
$(document).on('page:load', ready)
$(document).ready(ready)

$(document).ajaxStart ->
  $('.spinner').show()
 
$(document).ajaxStop ->
  $('.spinner').hide()

 $(document).on 'page:fetch', ->
  $('.spinner').show()

$(document).on 'page:receive', ->
  $('.spinner').hide()