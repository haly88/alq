module BotonesHelper

	def boton_atras_root
		link_to '<i class="fa fa-2x fa-angle-double-left"></i>'.html_safe, root_path, :title => "Atras"
	end

	def boton_atras_index
		link_to '<i class="fa fa-2x fa-angle-double-left"></i>'.html_safe, root_path+controller_path, :title => "Atras"
	end

	def boton_nuevo
		link_to '<i class="fa fa-2x fa-file-o"></i>'.html_safe, root_path+controller_path+'/new', :title => "Nuevo"
	end

	def boton_guardar
		link_to '<i class="fa fa-2x fa-floppy-o"></i>'.html_safe, '#', title: "Guardar", id: "guardar"
	end

	def boton_borrar
		link_to '<i class="fa fa-2x fa-trash-o"></i>'.html_safe, root_path+controller_path+'/'+params[:id], 
		method: :delete, data: { confirm: 'Esta seguro?' }
	end

	def boton_cobrar
		link_to '<i class="fa fa-2x fa-credit-card"></i>'.html_safe, new_liquidacion_path(contrato: @contrato), :title => "Cobrar"
	end

	def boton_impuestos
		link_to '<i class="fa fa-2x fa-balance-scale"></i>'.html_safe, '#', :title => "Impuestos", :id => "impuestos", "data-reveal-id" => "impuestos_modal"
	end

	def boton_imprimir
	 	link_to '<i class="fa fa-2x fa-print"></i>'.html_safe, '#', :onclick => 'window.print();return false;'
	 end 
end