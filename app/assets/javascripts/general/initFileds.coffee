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
	$('.datepicker:not([readonly])').datepicker()
		
$.fn.initDateMask = () ->
	$('.datepicker').inputmask('alias': 'date')

$.fn.initDateDefault = () ->
	if $('input.date:not([readonly])').val() == ''
		fechaHoy = $.datepicker.formatDate("dd/mm/yy", new Date())
		$('input.date:not([readonly])').val(fechaHoy)

$.fn.initDecimalMask = () ->
	$('.currency').inputmask('alias': 'currency', "digits": 4, "removeMaskOnSubmit": true, "autoUnmask": true)

$.fn.initInputMask = () ->
	$(":input").inputmask()

$.fn.initTables = () ->
	$(".dataTable").dataTable 
		responsive: true
		scrollX: true
    

$(document).ready(ready)
$(document).on('page:load',ready)
 

