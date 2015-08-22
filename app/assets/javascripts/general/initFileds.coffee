//= require chosen-jquery
//= require jquery-ui/datepicker
ready = () ->
	$.fn.initChosen()
	$.fn.initDatepicker()
	$.fn.initDateMask()
	$.fn.initDecimalMask()
	$.fn.initInputMask()

$.fn.initChosen = () ->
	$('select').chosen
		allow_single_deselect: true
		no_results_text: 'Sin resultados'
		width: '100%'

$.fn.updateChosen = (objeto) ->
	objeto.trigger("chosen:updated")

$.datepicker.setDefaults
  dateFormat: 'dd-mm-yy'

$.fn.initDatepicker = () ->
	$('input.date').datepicker()
		

$.fn.initDateMask = () ->
	$('input.date').inputmask('alias': 'date')


$.fn.initDecimalMask = () ->
	$('input.decimal').inputmask('alias': 'currency', "digits": 4, "removeMaskOnSubmit": true, "autoUnmask": true)

$.fn.initInputMask = () ->
	$(":input").inputmask()

$(document).ready(ready)
$(document).on('page:load',ready)
 

