# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $.fn.colorearCuotas()

  action_name = $('#action_name').val()  
  
  if action_name == 'edit' or action_name == 'update'
    $('#liquidacion_inquilino_id').prop('disabled', true).trigger('chosen:updated')
    $('#liquidacion_propietario_id').prop('disabled', true).trigger('chosen:updated')
    $('#liquidacion_contrato_id').prop('disabled', true).trigger('chosen:updated')
    $('#liquidacion_fecha').prop('disabled', true)
    $('#liquidacion_refresh').hide()

  else
    $('#liquidacion_inquilino_id').change ->
      $('#liquidacion_propietario_id').val('').trigger('chosen:updated')
      contrato = $('#liquidacion_inquilino_id :selected').closest('optgroup').prop('label')
      escaped_contrato = contrato.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
      if contrato
        contrato = $('#liquidacion_contrato_id option').filter(->
          $(this).text() == contrato
        ).prop('selected', true).trigger('chosen:updated')

    $('#liquidacion_propietario_id').change ->
      $('#liquidacion_inquilino_id').val('').trigger('chosen:updated')
      contrato = $('#liquidacion_propietario_id :selected').closest('optgroup').prop('label')
      escaped_contrato = contrato.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
      if contrato
        contrato = $('#liquidacion_contrato_id option').filter(->
          $(this).text() == contrato
        ).prop('selected', true).trigger('chosen:updated')

    inquilinos = $('#liquidacion_inquilino_id').html()
    propietario = $('#liquidacion_propietario_id').html()
    $('#liquidacion_contrato_id').change ->
      contrato = $('#liquidacion_contrato_id :selected').text()
      escaped_contrato = contrato.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
      options = $(inquilinos).filter("optgroup[label='#{escaped_contrato}']").html()
      options2 = $(propietario).filter("optgroup[label='#{escaped_contrato}']").html()
      if options or options2
        $('#liquidacion_inquilino_id').html(options).trigger('chosen:updated')
        $('#liquidacion_propietario_id').html(options2).val('').trigger('chosen:updated')
      else
        $('#liquidacion_inquilino_id').empty().trigger('chosen:updated')
        $('#liquidacion_propietario_id').empty().trigger('chosen:updated')

  $('#liquidacion_refresh').click -> 
    $('#liquidacion_liquidacion_refresh').val(1)
    $('.simple_form').submit()

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
  $('.contrato_items_saldado').each (k,v) ->
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


$(document).on('page:load', ready)
$(document).ready(ready)