class LiquidacionesController < ApplicationController
  before_action :set_liquidacion, only: [:show, :edit, :update, :destroy]
  before_action :set_contratos, only: [:new, :edit, :update, :create, :refresh]

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
    render :new 
  end

  # GET /liquidaciones/1/edit
  def edit
    set_contrato
  end

  # POST /liquidaciones
  # POST /liquidaciones.json
  def create
    @liquidacion = Liquidacion.new(liquidacion_params)
    if @liquidacion.save
      redirect_to @liquidacion, notice: t('action.save')
    else
      set_contrato
      render :new 
    end
  end

  # PATCH/PUT /liquidaciones/1
  # PATCH/PUT /liquidaciones/1.json
  def update
    if @liquidacion.update(liquidacion_params)
      redirect_to [:edit, @liquidacion], notice: t('action.update')
    else
      set_contrato
      render :edit 
    end
  end

  # DELETE /liquidaciones/1
  # DELETE /liquidaciones/1.json
  def destroy
    @liquidacion.destroy
    redirect_to liquidaciones_url, notice: t('action.delete')
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_liquidacion
    @liquidacion = Liquidacion.find(params[:id])
  end

  def set_contratos
    @contratos = Contrato.order(:nombre)
  end

  def set_contrato
    if @liquidacion.contrato
      @contrato = @liquidacion.contrato
      @contrato_items = @contrato.contratos_items.where('fecha_desde <= ?', @liquidacion.fecha).order('fecha_desde')
      @contrato_impuestos = @contrato.contratos_impuestos.where('fecha_pago <= ? AND pago = ?', @liquidacion.fecha, false)
    end
    unless @liquidacion.contratos_item
      @contrato_items.each do |c|
        if c.get_a_pagar > 0
          @contrato_item = c
          @liquidacion.contratos_item_id = c.id
          break
        end
      end
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def liquidacion_params
    params.require(:liquidacion).permit(:contrato_id, :contratos_item_id, :inquilino_id, :propietario_id,
    :fecha, :neto, :descuento, :comision, :total, :liquidacion_refresh)
  end
end
