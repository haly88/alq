# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
	$('form').on 'click', '.quitar_campos', () ->
		$(this).prev('input[type=hidden]').val('1')
		$(this).closest('.row').hide()
		event.preventDefault()

	$('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    $.fn.initChosen()
    $.fn.initDatepicker()
    $.fn.initInputMask()
    $.fn.initDateMask()
    event.preventDefault()
		
$(document).on('page:load', ready)
$(document).ready(ready)
