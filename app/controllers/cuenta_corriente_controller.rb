class CuentaCorrienteController < ApplicationController

	def index
		sql = "select nombre, codigo from personas"
    @resultado = ActiveRecord::Base.connection.exec_query(sql)
  end

end