ready = ->	
	$ ->	
		$('#guardar').click ->
			$('#form_principal').submit()

$(document).on('page:load', ready)
$(document).ready(ready)