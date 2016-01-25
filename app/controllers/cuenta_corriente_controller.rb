class CuentaCorrienteController < ApplicationController
	before_action :set_globales

	def index
		params.reject!{|k,v| v.empty?} if params
		persona_id = ActiveRecord::Base.connection.quote(params[:persona_id])
		fecha_desde = ActiveRecord::Base.connection.quote(params[:fecha_desde])
		fecha_hasta = ActiveRecord::Base.connection.quote(params[:fecha_hasta])
		tipo = ActiveRecord::Base.connection.quote(params[:tipo]) # 0 Ambos, 1 Inquilinos, 2 Propietarios
		totalizado = params[:totalizado] # 0 no, 1 si
		
		if totalizado == '1'
			sql = "select 
			personas.tipo as Tipo,
			personas.nombre as Persona,
			Case When personas.tipo = 'Inquilino' Then sum(coalesce(contratos_items.monto - coalesce(Liquidaciones.suma,0),0)) Else 0 End as PendienteDeCobro,
			Case When personas.tipo = 'Propietario' Then sum(coalesce(contratos_items.monto - coalesce(Pagos.suma,0),0)) Else 0 End as PendienteDePago
			from personas
			Left Join contratos_personas_tipos ON (contratos_personas_tipos.inquilino_id = personas.id OR contratos_personas_tipos.propietario_id = personas.id) 
			Left Join contratos ON contratos.id = contratos_personas_tipos.contrato_id
			Left Join contratos_items ON contratos_items.contrato_id = contratos.id
			Left Join inmuebles ON inmuebles.id = contratos.inmueble_id
			Left join (select contratos_item_id, sum(neto) as suma from liquidaciones group by contratos_item_id) Liquidaciones
			ON Liquidaciones.contratos_item_id = contratos_items.id 
			Left join (select contratos_item_id, sum(neto) as suma from pagos group by contratos_item_id) pagos
			ON contratos_items.id = pagos.contratos_item_id
			where 
					 	(#{persona_id} is NULL OR personas.id = #{persona_id})
			and		(#{fecha_desde} is NULL OR contratos_items.fecha_desde >= #{fecha_desde})
			and		(#{fecha_hasta} is NULL OR contratos_items.fecha_desde <= #{fecha_hasta})
			and		((coalesce(#{tipo},0) = '0' and personas.tipo in ('Inquilino', 'Propietario')) OR
						(coalesce(#{tipo},0) = '1' and personas.tipo = 'Inquilino') OR
						(coalesce(#{tipo},0) = '2' and personas.tipo = 'Propietario'))
			group by 	personas.tipo,
								personas.nombre
			order by 	personas.tipo,
								personas.nombre"
		else
			sql = "select 
			personas.tipo as Tipo,
			personas.nombre as Persona,
			contratos.nombre as Contrato,
			inmuebles.direccion || ' ' || inmuebles.piso || ' ' || inmuebles.depto as Direccion,
			contratos_items.fecha_desde as CuotaFecha,
			contratos_items.monto as CuotaMonto,
			Case When personas.tipo = 'Inquilino' Then coalesce(Liquidaciones.suma,0) Else 0 End as Cobrado,
			Case When personas.tipo = 'Inquilino' Then coalesce(contratos_items.monto - coalesce(Liquidaciones.suma,0),0) Else 0 End as PendienteDeCobro,
			Case When personas.tipo = 'Propietario' Then coalesce(Pagos.suma,0) Else 0 End as Pagado,
			Case When personas.tipo = 'Propietario' Then coalesce(contratos_items.monto - coalesce(Pagos.suma,0),0) Else 0 End as PendienteDePago
			from personas
			Left Join contratos_personas_tipos ON (contratos_personas_tipos.inquilino_id = personas.id OR contratos_personas_tipos.propietario_id = personas.id) 
			Left Join contratos ON contratos.id = contratos_personas_tipos.contrato_id
			Left Join contratos_items ON contratos_items.contrato_id = contratos.id
			Left Join inmuebles ON inmuebles.id = contratos.inmueble_id
			Left join (select contratos_item_id, sum(neto) as suma from liquidaciones group by contratos_item_id) Liquidaciones
			ON Liquidaciones.contratos_item_id = contratos_items.id 
			Left join (select contratos_item_id, sum(neto) as suma from pagos group by contratos_item_id) pagos
			ON contratos_items.id = pagos.contratos_item_id
			where 
					 	(#{persona_id} is NULL OR personas.id = #{persona_id})
			and		(#{fecha_desde} is NULL OR contratos_items.fecha_desde >= #{fecha_desde})
			and		(#{fecha_hasta} is NULL OR contratos_items.fecha_desde <= #{fecha_hasta})
			and		((coalesce(#{tipo},0) = '0' and personas.tipo in ('Inquilino', 'Propietario')) OR
						(coalesce(#{tipo},0) = '1' and personas.tipo = 'Inquilino') OR
						(coalesce(#{tipo},0) = '2' and personas.tipo = 'Propietario'))
			order by 	personas.tipo,
								personas.nombre,
								contratos.nombre,
								contratos_items.fecha_desde"
		end

    @resultado = ActiveRecord::Base.connection.exec_query(sql)
    render 'informes/index'
  end

  private

  def set_globales
  	@personas = Persona.all
  end

end