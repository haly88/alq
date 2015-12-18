# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  inquilinos = $('#liquidacion_inquilino_id').html()
  action_name = $('#action_name').val() 
  controller_name = $('#controller_name').val() 
  if $('#liquidacion_contrato_id').val() != ''
    $.fn.calcularPersonas(inquilinos)
  
  if controller_name == 'liquidaciones'
    if action_name == 'edit' or action_name == 'update'
      $('#liquidacion_inquilino_id').prop('disabled', true).trigger('chosen:updated')
      $('#liquidacion_contrato_id').prop('disabled', true).trigger('chosen:updated')
      $('#liquidacion_fecha').prop('disabled', true)
      $('#liquidacion_refresh').hide()
    if action_name == 'new'
      $('#guardar').hide()

  $('#liquidacion_contrato_id').change ->
    $.fn.calcularPersonas(inquilinos)

  $('#liquidacion_refresh').click -> 
    contrato = $('#liquidacion_contrato_id').val()
    inquilino = $('#liquidacion_inquilino_id').val()
    fecha = $('#liquidacion_fecha').val()
    $.ajax
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
            $.fn.calcularTotalLiquidacion() 
            $('#guardar').show()
          else
            $("#liquidacion_ajax_refresh").html("<h2>No se Encontraron Cuotas</h2>")
            $('#guardar').hide()
        error:(data) ->
          return false

  $('#impuestos_guardar').click ->
    $('#form_impuestos').submit()

$(document).on 'change', {'#liquidacion_neto', '#liquidacion_mora', '#liquidacion_descuento'}, () ->
  $.fn.calcularTotalLiquidacion()
    
$.fn.calcularPersonas = (inquilinos) ->
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

$(document).on('page:load', ready)
$(document).ready(ready)