# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  action_name = $('#action_name').val()
  $.fn.funcionesImpuestos()
  $.fn.funcionesCuotas()

  $('#cuotas_refresh').click ->
    $('.spinner').show()
    $('#cuotas_refresh').hide()
    setTimeout (->
      cuotas = Number($('#cuotas_cantidad').val())
      fechaInicio = $.datepicker.parseDate("dd/mm/yy", $('#cuotas_fecha_inicio').val())
      fechaInicio = new Date(fechaInicio.setDate(1))
      montoInicio = Number($('#cuotas_monto_inicio').val())
      incremento = (1 + (Number($('#cuotas_incremento').val()) / 100))
      cada = Number($('#cuotas_cada').val())
      $('.contratos_items_destroy').val('1')
      $('.contratos_items_row').hide()
      contador = 0
      i = 0
      if cuotas and fechaInicio and montoInicio
        for [1..cuotas]
          i++
          contador = contador + 1
          time = new Date().getTime() + i
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
      $.fn.funcionesCuotas()
      $('.spinner').hide()
      $('#cuotas_refresh').show()
    ), 1000

  $('#impuestos_refresh').click ->
    $('.spinner').show()
    $('#impuestos_refresh').hide()
    setTimeout (->
      impuesto = $('#impuestos_impuesto_id').val()
      cuotas = Number($('#impuestos_cantidad').val())
      fechaInicio = $.datepicker.parseDate("dd/mm/yy", $('#impuestos_fecha_inicio').val())
      fechaInicio = new Date(fechaInicio.setDate(1))
      cada = Number($('#impuestos_cada').val())
      $('.contratos_impuestos_impuesto').each (k,v) ->
        if $(v).val() == impuesto
          $(v).closest('.row').children('input[type=hidden]').val('1')
          $(v).closest('.row').hide()
      contador = 0
      i = 0
      for [1..cuotas]
        i++
        contador = contador + 1
        fechaInicio = new Date(fechaInicio.setMonth(fechaInicio.getMonth()+1))
        if contador == cada
          contador = 0
          time = new Date().getTime() + i
          regexp = new RegExp($('.content.active .add_fields').data('id'), 'g')
          $('.content.active .add_fields').before($('.content.active .add_fields').data('fields').replace(regexp, time))
          $('.contratos_impuestos_fecha_pago:last').val($.datepicker.formatDate("dd/mm/yy", fechaInicio))
          $('.contratos_impuestos_impuesto:last').val(impuesto)
      $.fn.initChosen()
      $.fn.initDatepicker()
      $.fn.initInputMask()
      $.fn.initDateMask()
      $.fn.initDecimalMask()
      $.fn.funcionesImpuestos()
      $('.spinner').hide()
      $('#impuestos_refresh').show()
    ), 1000

  $('form').on 'change', '.contratos_impuestos_pago', () ->
    $.fn.funcionesImpuestos()

$(document).on('page:load', ready)
$(document).ready(ready)

$.fn.funcionesImpuestos = () ->
  $('.contratos_impuestos_pago').each (k,v) ->
    if $(v).prop('checked') == true
      $(v).closest('.row').children().children('.contratos_impuestos_fecha_pago').css('border-color','green')
    else
      $(v).closest('.row').children().children('.contratos_impuestos_fecha_pago').css('border-color','red')

$.fn.funcionesCuotas = () ->
  $('.contratos_items_pago').each (k,v) ->
    if Number($(v).val()) == 0
      $(v).css('border-color','red')
    else if Number($(v).val()) < Number($(v).closest('.row').children().children('.contratos_items_monto').val())
      $(v).css('border-color','yellow')
      $(v).closest('.row').children().children().prop('readonly', true)
      $(v).closest('.row').children().children('.quitar_campos').hide()
    else
      $(v).css('border-color','green')
      $(v).closest('.row').children().children().prop('readonly', true)
      $(v).closest('.row').children().children('.quitar_campos').hide()
