# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->

  $('#liquidacion_inquilino_id').change ->
    $('#liquidacion_propietario_id').val('').trigger('chosen:updated')

  $('#liquidacion_propietario_id').change ->
    $('#liquidacion_inquilino_id').val('').trigger('chosen:updated')

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

$(document).on('page:load', ready)
$(document).ready(ready)