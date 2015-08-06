ready = ->	
	$ ->	
		$('#guardar').click ->
			$('.simple_form').submit()

$(document).on('page:load', ready)
$(document).ready(ready)