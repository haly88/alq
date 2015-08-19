# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
	$('form').on 'click', '.quitar_campos', () ->
		$(this).prev('input[type=hidden]').val('1')
		$(this).closest('.row').hide()
		event.preventDefault()


	$('.add_fields').click () ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    $.fn.initChosen()
    $.fn.initDatepicker()
    $.fn.initInputMask()
    $.fn.initDateMask()
    $.fn.initDecimalMask()
    event.preventDefault()

  $('#cuotas_refresh').click ->
    fechaInicio = $('#contrato_fecha_inicio').datepicker("getDate")
    $('#contrato_fecha_inicio').datepicker("setDate", "fechaInicio + 3m")
    $('.contratos_items_fecha_desde').last().datepicker("setDate", "fechaInicio + 1m")
    if cuotas 
      for [1..cuotas]
        $('.content.active .add_fields').click()
        
    
$(document).on('page:load', ready)
$(document).ready(ready)



