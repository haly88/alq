class MovimientosController < ApplicationController
  before_action :set_movimiento, only: [:show, :edit, :update, :destroy]
  before_action :set_globales

  # GET /movimientos
  # GET /movimientos.json
  def index
    @movimientos = Movimiento.all
  end

  # GET /movimientos/1
  # GET /movimientos/1.json
  def show
  end

  # GET /movimientos/new
  def new
    @movimiento = Movimiento.new
  end

  # GET /movimientos/1/edit
  def edit
  end

  # POST /movimientos
  # POST /movimientos.json
  def create
    @movimiento = Movimiento.new(movimiento_params)
    if @movimiento.save
      redirect_to [:edit, @movimiento], notice: t('action.save')
    else
      render :new 
    end
  end

  # PATCH/PUT /movimientos/1
  # PATCH/PUT /movimientos/1.json
  def update
    if @movimiento.update(movimiento_params)
      redirect_to [:edit, @movimiento], notice: t('action.update')
    else
      render :edit
    end
  end

  # DELETE /movimientos/1
  # DELETE /movimientos/1.json
  def destroy
    @movimiento.destroy
    redirect_to movimientos_url, notice: t('action.delete')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movimiento
      @movimiento = Movimiento.find(params[:id])
    end

    def set_globales
      @cajas = Caja.all
      @cajas_conceptos = CajasConcepto.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movimiento_params
      params.require(:movimiento).permit(:caja_id, :fecha, :cajas_concepto_id, :descripcion, :monto)
    end
end
