class CuentaCorrienteController < ApplicationController

	def index
		sql = 
"Select 
personas.nombre as Persona,
inmuebles.direccion || ' ' || inmuebles.piso || ' ' || inmuebles.depto as Direccion,
contratos.nombre as Contrato,
contratos_items.fecha_desde as Cuota,
contratos_items.monto as Monto,
contratos_items.monto - coalesce(Liquidaciones.suma,0) as Saldo
From contratos_items
Left join (select contratos_item_id, sum(neto) as suma from liquidaciones group by contratos_item_id) Liquidaciones
ON contratos_items.id = Liquidaciones.contratos_item_id
Inner Join contratos_personas_tipos ON contratos_items.contrato_id = contratos_personas_tipos.contrato_id and inquilino_id is not null
Inner Join personas ON contratos_personas_tipos.inquilino_id = personas.id
Inner Join contratos ON contratos_items.contrato_id = contratos.id
Inner Join inmuebles ON inmuebles.id = contratos.inmueble_id
Where monto > coalesce(Liquidaciones.suma,0)
Order By personas.nombre, contratos_items.fecha_desde"

    @resultado = ActiveRecord::Base.connection.exec_query(sql)
    render 'informes/index'
  end

end