class EmpresasController < ApplicationController
  before_action :set_empresa, only: [:edit, :update]

 
  # GET /empresas/1/edit
  def edit
  end

  # PATCH/PUT /empresas/1
  # PATCH/PUT /empresas/1.json
  def update
    if @empresa.update(empresa_params)
      redirect_to root_path, notice: t('action.save')
    else
      render :edit 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empresa
      @empresa = Empresa.first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def empresa_params
      params.require(:empresa).permit(:nombre, :razon_social, :direccion, :piso, :depto, :telefono, :email, :mora_fija_dia, :mora_fija_monto,
      :mora_fija_porc, :mora_var_dia, :mora_var_monto, :mora_var_porc)
    end
end
