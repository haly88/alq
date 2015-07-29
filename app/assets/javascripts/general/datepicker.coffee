//= require jquery-ui/datepicker
ready = ->
	$ ->
		$('.datepicker').datepicker
			dateFormat: 'dd-mm-yy'

$(document).on('page:load', ready)
$(document).ready(ready)