$('#form_fields').html("<%= j render 'form_fields' %>")
$.fn.initDecimalMask()
$.fn.initInputMask()
$.fn.calcularTotalLiquidacion()
$('#guardar').show()


