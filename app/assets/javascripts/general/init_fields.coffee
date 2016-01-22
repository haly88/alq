//= require chosen-jquery
//= require jquery-ui/datepicker
ready = () ->
	$.fn.initChosen()
	$.fn.initDatepicker()
	$.fn.initDateMask()
	$.fn.initDateDefault()
	$.fn.initDecimalMask()
	$.fn.initPorcentajeMask()
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
	if $('.datepicker:not([readonly])').val() == ''
		fechaHoy = $.datepicker.formatDate("dd/mm/yy", new Date())
		$('.datepicker:not([readonly])').val(fechaHoy)

$.fn.initDecimalMask = () ->
	$('.currency').inputmask('alias': 'currency', "digits": 4, "removeMaskOnSubmit": true, "autoUnmask": true)

$.fn.initPorcentajeMask = () ->
	$('.porcentaje').inputmask('alias': 'numeric', 'digits': 2, 'suffix': ' %', 'max': 999, 'autoUnmask' : true)

$.fn.initInputMask = () ->
	$(":input").inputmask()

$.fn.initTables = () ->
	$(".dataTable").DataTable({
    responsive: true,
    colReorder: true,
    scrollY: "400px",
    scrollCollapse: true,
    paging: false,
    stateSave: true,
    language: {
    	decimal: ",",
    	thousands: "." 
    },
    dom: 'fBrtip',
    buttons: [{text: 'Filtros', className: 'buttons-filtro'}, 'excel', 'print']
  })

$(document).ready(ready)
$(document).on('page:load',ready)
 

