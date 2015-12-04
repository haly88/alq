//= require chosen-jquery
//= require jquery-ui/datepicker
ready = () ->
	$.fn.initChosen()
	$.fn.initDatepicker()
	$.fn.initDateMask()
	$.fn.initDateDefault()
	$.fn.initDecimalMask()
	$.fn.initInputMask()
	$.fn.initTables()
	$("#data-alert").delay(2000).fadeOut()

$.fn.initChosen = () ->
	$('select').chosen
		allow_single_deselect: true
		no_results_text: 'Sin resultados'
		width: '100%'

$.datepicker.setDefaults
  dateFormat: 'dd/mm/yy'

$.fn.initDatepicker = () ->
	$('input.date:not([readonly])').datepicker()
		
$.fn.initDateMask = () ->
	$('input.date').inputmask('alias': 'date')

$.fn.initDateDefault = () ->
	if $('input.date:not([readonly])').val() == ''
		fechaHoy = $.datepicker.formatDate("dd/mm/yy", new Date())
		$('input.date:not([readonly])').val(fechaHoy)

$.fn.initDecimalMask = () ->
	$('input.decimal').inputmask('alias': 'currency', "digits": 4, "removeMaskOnSubmit": true, "autoUnmask": true)

$.fn.initInputMask = () ->
	$(":input").inputmask()

$.fn.initTables = () ->
	$(".dataTable").DataTable responsive: true

$(document).ready(ready)
$(document).on('page:load',ready)
 

