 <% if @contratos_item %>
	$('#form_fields').html("<%= j render 'form_fields' %>")
	$.fn.initDecimalMask()
	$.fn.initInputMask()
	$.fn.calcularTotalLiquidacion()
	$('#guardar').show()
	$.fn.calcularComision()
	$.fn.calcularTotalPago()
 <% else %>
 	$('#form_fields').html("<h3>No se Encontraron Cuotas</h3>")
 <% end %>
