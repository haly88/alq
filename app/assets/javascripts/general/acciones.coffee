ready = ->	

	$('#guardar').click ->
		$('#form_principal').submit()

	$('#comentarios').click ->
		$.ajax
      type: "GET",
      url: $('#controller_full_path').val() + '/' + $('#controller_id').val() + '/comentarios',
      success:(data) ->
        html = data
        html = $(html).find("#ajax_comentarios").html()
        $('#comentarios_modal').html(html)
      error:(data) ->
        return false
		
$(document).on('page:load', ready)
$(document).ready(ready)

$(document).on 'click', '#comentarios_guardar', () ->
  $('#form_comentarios').submit()