class EstadoDeCajaController < ApplicationController
	before_action :set_globales

	def index
		params.reject!{|k,v| v.empty?} if params
		fecha_desde = ActiveRecord::Base.connection.quote(params[:fecha_desde])
		fecha_hasta = ActiveRecord::Base.connection.quote(params[:fecha_hasta])
		caja_id = ActiveRecord::Base.connection.quote(params[:caja_id])
		cajas_concepto_id = ActiveRecord::Base.connection.quote(params[:cajas_concepto_id]) # 0 Ambos, 1 Inquilinos, 2 Propietarios
		totalizado = params[:totalizado] # 0 no, 1 si
		
		if totalizado == '1'
			sql = "Select
			cajas.nombre as Caja,
			sum(movimientos.monto) as Monto
			From movimientos
			Left Join cajas ON cajas.id = movimientos.caja_id
			Left Join cajas_conceptos ON cajas_conceptos.id = movimientos.cajas_concepto_id
			where 
						(#{fecha_desde} is NULL OR movimientos.fecha >= #{fecha_desde})
			and		(#{fecha_hasta} is NULL OR movimientos.fecha <= #{fecha_hasta})
			and	 	(#{caja_id} is NULL OR cajas.id = #{caja_id})
			and	 	(#{cajas_concepto_id} is NULL OR cajas_conceptos.id = #{cajas_concepto_id})
			Group by cajas.nombre"
		else
			sql = "Select
			movimientos.fecha as Fecha,
			cajas.nombre as Caja,
			cajas_conceptos.nombre as Concepto,
			movimientos.monto as Monto,
			movimientos.descripcion as Descripcion,
			movimientos.liquidacion_id as Liquidacion,
			movimientos.pago_id as Pago
			From movimientos
			Left Join cajas ON cajas.id = movimientos.caja_id
			Left Join cajas_conceptos ON cajas_conceptos.id = movimientos.cajas_concepto_id
			where 
						(#{fecha_desde} is NULL OR movimientos.fecha >= #{fecha_desde})
			and		(#{fecha_hasta} is NULL OR movimientos.fecha <= #{fecha_hasta})
			and	 	(#{caja_id} is NULL OR cajas.id = #{caja_id})
			and	 	(#{cajas_concepto_id} is NULL OR cajas_conceptos.id = #{cajas_concepto_id})"
		end

    @resultado = ActiveRecord::Base.connection.exec_query(sql)

    respond_to do |format|
    	format.html {render 'informes/index'}
    	format.js {render 'informes/index'}
    end
  end

  private

  def set_globales
  	@cajas = Caja.all
  	@cajas_conceptos = CajasConcepto.all
  end

end