# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  propietarios = $('#pago_propietario_id').html()
  action_name = $('#action_name').val() 
  controller_name = $('#controller_name').val() 
  if $('#pago_contrato_id').val() != ''
    $.fn.calcularPropietario(propietarios)
  
  if controller_name == 'pagos'
    if action_name == 'edit' or action_name == 'update'
      $('#pago_propietario_id').prop('disabled', true).trigger('chosen:updated')
      $('#pago_contrato_id').prop('disabled', true).trigger('chosen:updated')
      $('#pago_fecha').prop('disabled', true)
      $('#pago_refresh').hide()
    if action_name == 'new'
      $('#guardar').hide()

  $('#pago_contrato_id').change ->
    $.fn.calcularPropietario(propietarios)

  $('#pago_refresh').click -> 
    $('#form_refresh').submit()

$(document).on('page:load', ready)
$(document).ready(ready)

$(document).on 'change', {'#pago_comision', '#pago_descuento'}, () ->
  $.fn.calcularTotalPago()

$(document).on 'change', '#pago_neto', () ->
  $.fn.calcularComision()
  $.fn.calcularTotalPago()
    
$.fn.calcularPropietario = (propietarios) ->
  contrato = $('#pago_contrato_id :selected').text()
  escaped_contrato = contrato.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
  options = $(propietarios).filter("optgroup[label='#{escaped_contrato}']").html()
  if options
    $('#pago_propietario_id').html(options).trigger('chosen:updated')
  else
    $('#pago_propietario_id').empty().trigger('chosen:updated')

$.fn.calcularTotalPago = () ->
  neto = Number($('#pago_neto').val())
  comision = Number($('#pago_comision').val())
  descuento = Number($('#pago_descuento').val())
  total = neto - comision - descuento
  $('#pago_total').val(total)

$.fn.calcularComision = () ->
  neto = Number($('#pago_neto').val())
  comision_monto = Number($('#comision_monto').val())
  comision_porc = Number($('#comision_porc').val())
  mora_total = 0
  mora_total = comision_monto
  mora_total += neto * (comision_porc / 100)
  $('#pago_comision').val(mora_total)