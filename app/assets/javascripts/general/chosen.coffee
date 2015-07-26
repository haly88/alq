//= require chosen-jquery
ready = ->
	$ ->
	  # enable chosen js
	  $('.chosen').chosen
	    allow_single_deselect: true
	    no_results_text: 'No results matched'
	    width: '200px'

$(document).on('page:load', ready)
$(document).ready(ready)

 

