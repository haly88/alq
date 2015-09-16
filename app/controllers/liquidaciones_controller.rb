class LiquidacionesController < ApplicationController
  before_action :set_liquidacion, only: [:show, :edit, :update, :destroy]

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

  # GET /liquidaciones/1/edit
  def edit
  end

  # POST /liquidaciones
  # POST /liquidaciones.json
  def create
    @liquidacion = Liquidacion.new(liquidacion_params)

    if @liquidacion.save
      redirect_to @liquidacion, notice: 'Liquidacion was successfully created.' 
    else
      render :new 
    end
  end

  # PATCH/PUT /liquidaciones/1
  # PATCH/PUT /liquidaciones/1.json
  def update
    if @liquidacion.update(liquidacion_params)
      redirect_to [:edit, @liquidacion], notice: 'Liquidacion was successfully updated.'
    else
      render :edit 
    end
  end

  # DELETE /liquidaciones/1
  # DELETE /liquidaciones/1.json
  def destroy
    @liquidacion.destroy
    redirect_to liquidaciones_url, notice: 'Liquidacion was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_liquidacion
      @liquidacion = Liquidacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def liquidacion_params
      params.require(:liquidacion).permit(:contrato_id, :inquilino_id, :propietario_id,
      :fecha, :neto, :descuento, :comision, :total)
    end
end
