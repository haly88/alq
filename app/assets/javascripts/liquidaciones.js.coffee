# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  inquilinos = $('#liquidacion_inquilino_id').html()
  action_name = $('#action_name').val() 
  controller_name = $('#controller_name').val() 
  if $('#liquidacion_contrato_id').val() != ''
    $.fn.calcularInquilino(inquilinos)
  
  if controller_name == 'liquidaciones'
    if action_name == 'edit' or action_name == 'update'
      $('#liquidacion_inquilino_id').prop('disabled', true).trigger('chosen:updated')
      $('#liquidacion_contrato_id').prop('disabled', true).trigger('chosen:updated')
      $('#liquidacion_fecha').prop('disabled', true)
      $('#liquidacion_refresh').hide()
    if action_name == 'new'
      $('#guardar').hide()

  $('#liquidacion_contrato_id').change ->
    $.fn.calcularInquilino(inquilinos)

  $('#liquidacion_refresh').click -> 
    $('#form_refresh').submit()

  $('#impuestos_guardar').click ->
    $('#form_impuestos').submit()

$(document).on('page:load', ready)
$(document).ready(ready)

$(document).on 'change', {'#liquidacion_mora', '#liquidacion_descuento'}, () ->
  $.fn.calcularTotalLiquidacion()

$(document).on 'change', '#liquidacion_neto', () ->
  $.fn.calcularMora()
  $.fn.calcularTotalLiquidacion()
    
$.fn.calcularInquilino = (inquilinos) ->
  contrato = $('#liquidacion_contrato_id :selected').text()
  escaped_contrato = contrato.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
  options = $(inquilinos).filter("optgroup[label='#{escaped_contrato}']").html()
  if options
    $('#liquidacion_inquilino_id').html(options).trigger('chosen:updated')
  else
    $('#liquidacion_inquilino_id').empty().trigger('chosen:updated')

$.fn.calcularTotalLiquidacion = () ->
  neto = Number($('#liquidacion_neto').val())
  mora = Number($('#liquidacion_mora').val())
  descuento = Number($('#liquidacion_descuento').val())
  total = neto + mora - descuento
  $('#liquidacion_total').val(total)

$.fn.calcularMora = () ->
  fecha = Number($('#liquidacion_fecha_day').val())
  neto = Number($('#liquidacion_neto').val())
  mora_fija_dia = Number($('#mora_fija_dia').val())
  mora_fija_monto = Number($('#mora_fija_monto').val())
  mora_fija_porc = Number($('#mora_fija_porc').val())
  mora_var_dia = Number($('#mora_var_dia').val())
  mora_var_monto = Number($('#mora_var_monto').val())
  mora_var_porc = Number($('#mora_var_porc').val())
  mora_total = 0
  if fecha > mora_fija_dia
      mora_total = mora_fija_monto
      mora_total += neto * (mora_fija_porc / 100)
    if fecha > mora_var_dia
      mora_total += (fecha - mora_var_dia) * mora_var_monto
      mora_total += (fecha - mora_var_dia) * (neto * (mora_var_porc / 100))
  $('#liquidacion_mora').val(mora_total)
  