class LiquidacionesController < ApplicationController
  before_action :set_liquidacion, only: [:show, :edit, :update, :destroy]
  before_action :set_contratos, only: [:new, :edit, :update, :create]

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
    set_contrato
  end

  # POST /liquidaciones
  # POST /liquidaciones.json
  def create
    @liquidacion = Liquidacion.new(liquidacion_params)
    if liquidacion_params[:liquidacion_refresh] == "1"
      @liquidacion.liquidacion_refresh = 0
      set_contrato
      render :new 
    else
      if @liquidacion.save
        redirect_to @liquidacion, notice: 'Guardado' 
      else
        set_contrato
        render :new 
      end
    end
  end

  # PATCH/PUT /liquidaciones/1
  # PATCH/PUT /liquidaciones/1.json
  def update
    if @liquidacion.update(liquidacion_params)
      redirect_to [:edit, @liquidacion], notice: 'Actualizado'
    else
      render :edit 
    end
  end

  # DELETE /liquidaciones/1
  # DELETE /liquidaciones/1.json
  def destroy
    @liquidacion.destroy
    redirect_to liquidaciones_url, notice: 'Borrado'
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
      @contrato = @liquidacion.contrato
      @contrato_total = @contrato.calcularTotal
      @contrato_pagado = @contrato.calcularPagado
      @contrato_saldo = @contrato.calcularSaldo
      @contrato_total_a_pagar = @contrato.calcularTotalAPagar(@liquidacion.fecha)
      @contrato_items = @contrato.contratos_items_cuotas(@liquidacion.fecha)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def liquidacion_params
      params.require(:liquidacion).permit(:contrato_id, :inquilino_id, :propietario_id,
      :fecha, :neto, :descuento, :comision, :total, :liquidacion_refresh)
    end
end
