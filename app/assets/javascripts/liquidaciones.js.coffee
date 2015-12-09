# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  inquilinos = $('#liquidacion_inquilino_id').html()
  action_name = $('#action_name').val() 
  $.fn.colorearCuotas()
  $.fn.calcularCampos(action_name)
  if $('#liquidacion_contrato_id').val() != ''
    $.fn.calcularPersonas(inquilinos)
  $('#guardar').hide()

  if action_name == 'edit' or action_name == 'update'
    $('#liquidacion_inquilino_id').prop('disabled', true).trigger('chosen:updated')
    $('#liquidacion_contrato_id').prop('disabled', true).trigger('chosen:updated')
    $('#liquidacion_fecha').prop('disabled', true)
    $('#liquidacion_refresh').hide()
    $('#guardar').show()
    $('#contrato_total_a_pagar').parent().hide()

  $('#liquidacion_contrato_id').change ->
    $.fn.calcularPersonas(inquilinos)

  $('#liquidacion_refresh').click -> 
    contrato = $('#liquidacion_contrato_id').val()
    inquilino = $('#liquidacion_inquilino_id').val()
    fecha = $('#liquidacion_fecha').val()
    $.ajax({
      type: "POST",
      url: "/liquidaciones/refresh",
      data: 
        liquidacion: 
          contrato_id: contrato
          inquilino_id: inquilino 
          fecha: fecha 
      success:(data) ->
        html = data
        html = $(html).find("#liquidacion_ajax_refresh").html()
        if $(html).is("#form_principal")
          $("#liquidacion_ajax_refresh").html(html)
          $.fn.initChosen()
          $.fn.initDatepicker()
          $.fn.initDateMask()
          $.fn.initDateDefault()
          $.fn.initDecimalMask()
          $.fn.initInputMask()
          $.fn.calcularCampos(action_name)
          $('#guardar').show()
        else
          $("#liquidacion_ajax_refresh").html("<h2>No se Encontraron Cuotas</h2>")
          $('#guardar').hide()
      error:(data) ->
        return false
    })

$(document).on 'change', '#liquidacion_neto', () ->
  $.fn.calcularTotalLiquidacion()
$(document).on 'change', '#liquidacion_descuento', () ->
  $.fn.calcularTotalLiquidacion()   
    
$.fn.calcularPersonas = (inquilinos) ->
  contrato = $('#liquidacion_contrato_id :selected').text()
  escaped_contrato = contrato.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
  options = $(inquilinos).filter("optgroup[label='#{escaped_contrato}']").html()
  if options
    $('#liquidacion_inquilino_id').html(options).trigger('chosen:updated')
  else
    $('#liquidacion_inquilino_id').empty().trigger('chosen:updated')

$.fn.colorearCuotas = () ->
  $('.contrato_items_saldo').each (k,v) ->
    saldo = Number($(v).val())
    if saldo == 0
      $(v).css('border-color', 'red');
    else
      $('.contrato_items_monto').each (k2,v2) ->
        monto = Number($(v2).val())
        if k == k2 
          if saldo == monto
            $(v).css('border-color', 'green');
          else
            $(v).css('border-color', 'yellow');

$.fn.calcularCampos = (action_name) ->
  if action_name != 'edit'
    totalAPagar = Number($('#contrato_total_a_pagar').val())
    $('#liquidacion_neto').val(totalAPagar)
    $('#liquidacion_total').val(totalAPagar)

$.fn.calcularTotalLiquidacion = () ->
  neto = Number($('#liquidacion_neto').val())
  descuento = Number($('#liquidacion_descuento').val())
  total = neto + descuento
  $('#liquidacion_total').val(total)

$(document).on('page:load', ready)
$(document).ready(ready)