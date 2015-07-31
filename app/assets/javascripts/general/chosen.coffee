//= require chosen-jquery
ready = ->
	$ ->
	  # enable chosen js
	  $('.chosen').chosen
	    allow_single_deselect: true
	    no_results_text: 'No results matched'
	    width: '100%'

$(document).on('page:load', ready)
$(document).ready(ready)

 

