# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
	$('form').on 'click', '.quitar_campos', () ->
		$(this).prev('input[type=hidden]').val('1')
		$(this).closest('.row').hide()
		return false


	$('form').on 'click', '.add_fields', () ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    $.fn.initChosen()
    $.fn.initDatepicker()
    $.fn.initInputMask()
    $.fn.initDateMask()
    $.fn.initDecimalMask()
    return false


  $('#cuotas_refresh').click ->
    cuotas = Number($('#contrato_cuotas').val())
    fechaInicio = $.datepicker.parseDate("dd/mm/yy", $('#contrato_fecha_inicio').val())
    montoInicio = Number($('#contrato_monto_inicio').val())
    incremento = (1 + (Number($('#contrato_incremento').val()) / 100))
    cada = Number($('#contrato_cada').val())
    $('.contratos_items_destroy').val('1')
    $('.contratos_items_row').hide()
    contador = 0
    if cuotas and fechaInicio and montoInicio
      for [1..cuotas]
        contador = contador + 1
        $('.content.active .add_fields').click()
        fechaInicio = new Date(fechaInicio.setMonth(fechaInicio.getMonth()+1))
        $('.contratos_items_fecha_desde:last').val($.datepicker.formatDate("dd/mm/yy", fechaInicio))
        $('.contratos_items_monto:last').val(montoInicio)
        if contador == cada
          contador = 0
          montoInicio = montoInicio * incremento
    

    
$(document).on('page:load', ready)
$(document).ready(ready)



