//= require chosen-jquery
//= require jquery-ui/datepicker
ready = () ->
	$.fn.initChosen()
	$.fn.initDatepicker()
	$.fn.initInputMask()

$.fn.initChosen = () ->
	$('select').chosen
		allow_single_deselect: true
		no_results_text: 'Sin resultados'
		width: '100%'

$.fn.updateChosen = (objeto) ->
	objeto.trigger("chosen:updated")

$.fn.initDatepicker = () ->
	$('.datepicker').datepicker
			dateFormat: 'dd-mm-yy'

$.fn.initInputMask = () ->
	$(":input").inputmask()

$(document).ready(ready)
$(document).on('page:load',ready)
 

