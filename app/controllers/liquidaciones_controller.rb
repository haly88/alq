class LiquidacionesController < ApplicationController
  before_action :set_liquidacion, only: [:show, :edit, :update, :destroy]
  before_action :set_globales

  # GET /liquidaciones
  # GET /liquidaciones.json
  def index
    @liquidaciones = Liquidacion.all
  end

  # GET /liquidaciones/1
  # GET /liquidaciones/1.json
  def show
  end

  # GET /liquidaciones/new
  def new
    @liquidacion = Liquidacion.new
    @liquidacion.contrato_id = params[:contrato] if params[:contrato]
  end

  def refresh
    @liquidacion = Liquidacion.new(liquidacion_params)
    set_contrato
    respond_to do |format|
      format.html { render :new }
      format.js
    end
  end

  # GET /liquidaciones/1/edit
  def edit
  end

  # POST /liquidaciones
  # POST /liquidaciones.json
  def create
    @liquidacion = Liquidacion.new(liquidacion_params)
    if @liquidacion.save 
      redirect_to [:edit, @liquidacion], notice: t('action.save')
    else
      render :new 
    end
  end

  # PATCH/PUT /liquidaciones/1
  # PATCH/PUT /liquidaciones/1.json
  def update
    if @liquidacion.update(liquidacion_params) 
      redirect_to [:edit, @liquidacion], notice: t('action.update')
    else
      render :edit 
    end
  end

  # DELETE /liquidaciones/1
  # DELETE /liquidaciones/1.json
  def destroy
    if @liquidacion.destroy
      redirect_to liquidaciones_url, notice: t('action.delete')
    else
      render :edit
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_liquidacion
    @liquidacion = Liquidacion.find(params[:id])
    @contrato = @liquidacion.contrato
  end

  def set_globales
    @contratos = Contrato.order(:nombre)
    @empresa = Empresa.find(1)
    @impuestos = Impuesto.all
  end

  def set_contrato
    if @liquidacion.contrato
      @contrato = @liquidacion.contrato
      @contratos_item = @contrato.get_primer_cuota_impaga(@liquidacion.fecha)
      if @contratos_item
        @liquidacion.contratos_item_id = @contratos_item.id 
        @liquidacion.neto = @contratos_item.get_a_cobrar
      end
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def liquidacion_params
    params.require(:liquidacion).permit(:contrato_id, :contratos_item_id, :inquilino_id, :fecha, :neto, :descuento,
    :mora, :total, :descripcion)
  end
end
