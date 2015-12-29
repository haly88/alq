ready = ->	

	$('#guardar').click ->
		$('#form_principal').submit()

	$('#comentarios').click ->
		
$(document).on('page:load', ready)
$(document).ready(ready)