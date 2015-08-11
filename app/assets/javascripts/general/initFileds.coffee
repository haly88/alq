//= require chosen-jquery
//= require jquery-ui/datepicker
ready = () ->
	$.fn.initChosen()
	$.fn.initDatepicker()
	$.fn.initInputMask()
	$.fn.initDateMask()
	$.fn.initDecimalMask()

$.fn.initChosen = () ->
	$('select').chosen
		allow_single_deselect: true
		no_results_text: 'Sin resultados'
		width: '100%'

$.fn.updateChosen = (objeto) ->
	objeto.trigger("chosen:updated")

$.fn.initDatepicker = () ->
	$('input.date').datepicker
			dateFormat: 'dd-mm-yy'

$.fn.initDateMask = () ->
	$('input.date').inputmask('alias': 'date')


$.fn.initDecimalMask = () ->
	$('input.decimal').inputmask('alias': 'currency', "digits": 4, "removeMaskOnSubmit": true)

$.fn.initInputMask = () ->
	$(":input").inputmask()

$(document).ready(ready)
$(document).on('page:load',ready)
 

