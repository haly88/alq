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
    contrato = $('#pago_contrato_id').val()
    propietario = $('#pago_propietario_id').val()
    fecha = $('#pago_fecha').val()
    $.ajax
        type: "POST",
        url: "/pagos/refresh",
        data: 
          pago: 
            contrato_id: contrato
            propietario_id: propietario 
            fecha: fecha 
        success:(data) ->
          html = data
          html = $(html).find("#pago_ajax_refresh").html()
          if $(html).is("#form_principal")
            $("#pago_ajax_refresh").html(html)
            $.fn.initChosen()
            $.fn.initDatepicker()
            $.fn.initDateMask()
            $.fn.initDateDefault()
            $.fn.initDecimalMask()
            $.fn.initInputMask()
            $.fn.calcularTotalPago() 
            $('#guardar').show()
          else
            $("#pago_ajax_refresh").html("<h3>No se Encontraron Cuotas</h3>")
            $('#guardar').hide()
        error:(data) ->
          return false

$(document).on 'change', {'#pago_neto', '#pago_descuento'}, () ->
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
  total = neto + comision - descuento
  $('#pago_total').val(total)

$(document).on('page:load', ready)
$(document).ready(ready)