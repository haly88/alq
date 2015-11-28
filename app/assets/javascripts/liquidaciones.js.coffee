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

  $('.contratos_impuestos_impuesto').prop('disabled', true).trigger('chosen:updated')
  if action_name == 'edit' or action_name == 'update'
    $('#liquidacion_inquilino_id').prop('disabled', true).trigger('chosen:updated')
    $('#liquidacion_contrato_id').prop('disabled', true).trigger('chosen:updated')
    $('#liquidacion_fecha').prop('disabled', true)
    $('#liquidacion_refresh').hide()

  $('#liquidacion_contrato_id').change ->
    $.fn.calcularPersonas(inquilinos)
    
$.fn.calcularPersonas = (inquilinos) ->
  contrato = $('#liquidacion_contrato_id :selected').text()
  escaped_contrato = contrato.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
  options = $(inquilinos).filter("optgroup[label='#{escaped_contrato}']").html()
  if options
    $('#liquidacion_inquilino_id').html(options).trigger('chosen:updated')
  else
    $('#liquidacion_inquilino_id').empty().trigger('chosen:updated')

  $('#liquidacion_refresh').click -> 
    $('#form_refresh').submit()

  $('#liquidacion_neto').change ->
    $.fn.calcularTotalLiquidacion()
  $('#liquidacion_comision').change ->
    $.fn.calcularTotalLiquidacion()
  $('#liquidacion_descuento').change ->
    $.fn.calcularTotalLiquidacion()

$.fn.calcularTotalLiquidacion = () ->
  neto = Number($('#liquidacion_neto').val())
  descuento = Number($('#liquidacion_descuento').val())
  comision = Number($('#liquidacion_comision').val())
  total = neto + descuento - comision 
  $('#liquidacion_total').val(total)

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
  if action_name == 'refresh'
    totalAPagar = Number($('#contrato_total_a_pagar').val())
    $('#liquidacion_neto').val(totalAPagar)
    $('#liquidacion_total').val(totalAPagar)

$(document).on('page:load', ready)
$(document).ready(ready)