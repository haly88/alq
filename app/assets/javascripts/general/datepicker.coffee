ready = ->
	$ ->
  	$('.datepicker').datepicker()
  	return
$(document).on('page:load', ready)
$(document).ready(ready)