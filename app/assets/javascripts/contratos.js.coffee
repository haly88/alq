# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->

  $('#cuotas_refresh').click ->
    cuotas = Number($('#cuotas_cantidad').val())
    fechaInicio = $.datepicker.parseDate("dd/mm/yy", $('#cuotas_fecha_inicio').val())
    fechaInicio = new Date(fechaInicio.setDate(1))
    montoInicio = Number($('#cuotas_monto_inicio').val())
    incremento = (1 + (Number($('#cuotas_incremento').val()) / 100))
    cada = Number($('#cuotas_cada').val())
    $('.contratos_items_destroy').val('1')
    $('.contratos_items_row').hide()
    contador = 0
    if cuotas and fechaInicio and montoInicio
      for [1..cuotas]
        contador = contador + 1
        time = new Date().getTime()
        regexp = new RegExp($('.content.active .add_fields').data('id'), 'g')
        $('.content.active .add_fields').before($('.content.active .add_fields').data('fields').replace(regexp, time))
        $('.contratos_items_fecha_desde:last').val($.datepicker.formatDate("dd/mm/yy", fechaInicio))
        fechaInicio = new Date(fechaInicio.setMonth(fechaInicio.getMonth()+1))
        $('.contratos_items_monto:last').val(montoInicio)
        if contador == cada
          contador = 0
          montoInicio = montoInicio * incremento
    $.fn.initChosen()
    $.fn.initDatepicker()
    $.fn.initInputMask()
    $.fn.initDateMask()
    $.fn.initDecimalMask()

  $('#impuestos_refresh').click ->
    impuesto = $('#impuestos_impuesto_id').val()
    cuotas = Number($('#impuestos_cantidad').val())
    fechaInicio = $.datepicker.parseDate("dd/mm/yy", $('#impuestos_fecha_inicio').val())
    fechaInicio = new Date(fechaInicio.setDate(1))
    cada = Number($('#impuestos_cada').val())
    $('.contratos_impuestos_destroy').val('1')
    $('.contratos_impuestos_row').hide()
    console.log(impuesto)
    contador = 0
    for [1..cuotas]
      contador = contador + 1
      fechaInicio = new Date(fechaInicio.setMonth(fechaInicio.getMonth()+1))
      if contador == cada
        contador = 0
        time = new Date().getTime()
        regexp = new RegExp($('.content.active .add_fields').data('id'), 'g')
        $('.content.active .add_fields').before($('.content.active .add_fields').data('fields').replace(regexp, time))
        $('.contratos_impuestos_fecha_pago:last').val($.datepicker.formatDate("dd/mm/yy", fechaInicio))
        $('.contratos_impuestos_impuesto:last').val(impuesto)



$(document).on('page:load', ready)
$(document).ready(ready)