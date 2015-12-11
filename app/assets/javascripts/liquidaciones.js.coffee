# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  inquilinos = $('#liquidacion_inquilino_id').html()
  action_name = $('#action_name').val() 
  if $('#liquidacion_contrato_id').val() != ''
    $.fn.calcularPersonas(inquilinos)
  

  if action_name == 'edit' or action_name == 'update'
    $('#liquidacion_inquilino_id').prop('disabled', true).trigger('chosen:updated')
    $('#liquidacion_contrato_id').prop('disabled', true).trigger('chosen:updated')
    $('#liquidacion_fecha').prop('disabled', true)
    $('#liquidacion_refresh').hide()
    $('#guardar').show()
    $('#liquidacion_totales').hide()
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
            $.fn.calcularCampos()
            $('#guardar').show()
          else
            $("#liquidacion_ajax_refresh").html("<h2>No se Encontraron Cuotas</h2>")
            $('#guardar').hide()
        error:(data) ->
          return false
    

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

$.fn.calcularCampos = () ->
  netoAPagar = Number($('#liquidacion_totales_neto').val())
  mora = Number($('#liquidacion_totales_mora').val())
  descuento = Number($('#liquidacion_descuento').val())
  $('#liquidacion_neto').val(netoAPagar)
  $('#liquidacion_total').val(netoAPagar + mora + descuento)

$.fn.calcularTotalLiquidacion = () ->
  neto = Number($('#liquidacion_neto').val())
  mora = Number($('#liquidacion_mora').val())
  descuento = Number($('#liquidacion_descuento').val())
  total = neto + mora + descuento
  $('#liquidacion_total').val(total)

$(document).on('page:load', ready)
$(document).ready(ready)