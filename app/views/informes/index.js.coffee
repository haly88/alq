$('#filtros_modal').foundation('reveal', 'close')
$('#informe_form').html("<%= j render 'informes/form' %>")
$.fn.initTables()