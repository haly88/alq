# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
	$('form').on 'click', '#accion_guardar', () ->
		$(this).prev('input[type=hidden]').val('1')
		$(this).closest('.row').hide()
		event.preventDefault()

$(document).on('page:load', ready)
$(document).ready(ready)