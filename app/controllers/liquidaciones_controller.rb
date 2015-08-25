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
  end

  # GET /liquidaciones/1/edit
  def edit
  end

  # POST /liquidaciones
  # POST /liquidaciones.json
  def create
    @liquidacion = Liquidacion.new(liquidacion_params)

    respond_to do |format|
      if @liquidacion.save
        format.html { redirect_to @liquidacion, notice: 'Liquidacion was successfully created.' }
        format.json { render :show, status: :created, location: @liquidacion }
      else
        format.html { render :new }
        format.json { render json: @liquidacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /liquidaciones/1
  # PATCH/PUT /liquidaciones/1.json
  def update
    respond_to do |format|
      if @liquidacion.update(liquidacion_params)
        format.html { redirect_to @liquidacion, notice: 'Liquidacion was successfully updated.' }
        format.json { render :show, status: :ok, location: @liquidacion }
      else
        format.html { render :edit }
        format.json { render json: @liquidacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /liquidaciones/1
  # DELETE /liquidaciones/1.json
  def destroy
    @liquidacion.destroy
    respond_to do |format|
      format.html { redirect_to liquidaciones_url, notice: 'Liquidacion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_liquidacion
      @liquidacion = Liquidacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def liquidacion_params
      params.require(:liquidacion).permit(:contrato_id, :fecha, :neto, :descuento, :comision, :total)
    end
end
