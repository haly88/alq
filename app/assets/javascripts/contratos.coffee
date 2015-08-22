# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->

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
        time = new Date().getTime()
        regexp = new RegExp($('.content.active .add_fields').data('id'), 'g')
        $('.content.active .add_fields').before($('.content.active .add_fields').data('fields').replace(regexp, time))
        fechaInicio = new Date(fechaInicio.setMonth(fechaInicio.getMonth()+1))
        $('.contratos_items_fecha_desde:last').val($.datepicker.formatDate("dd/mm/yy", fechaInicio))
        $('.contratos_items_monto:last').val(montoInicio)
        if contador == cada
          contador = 0
          montoInicio = montoInicio * incremento
    $.fn.initChosen()
    $.fn.initDatepicker()
    $.fn.initInputMask()
    $.fn.initDateMask()
    $.fn.initDecimalMask()

$(document).on('page:load', ready)
$(document).ready(ready)