class CajasController < ApplicationController
  before_action :set_caja, only: [:show, :edit, :update, :destroy]

  # GET /cajas
  # GET /cajas.json
  def index
    @cajas = Caja.all
  end

  # GET /cajas/1
  # GET /cajas/1.json
  def show
  end

  # GET /cajas/new
  def new
    @caja = Caja.new
  end

  # GET /cajas/1/edit
  def edit
  end

  # POST /cajas
  # POST /cajas.json
  def create
    @caja = Caja.new(caja_params)
    if @caja.save
      redirect_to [:edit, @caja], notice: t('action.save')
    else
      render :new 
    end
  end

  # PATCH/PUT /cajas/1
  # PATCH/PUT /cajas/1.json
  def update
    if @caja.update(caja_params)
      redirect_to [:edit, @caja], notice: t('action.update')
    else
      render :edit
    end
  end

  # DELETE /cajas/1
  # DELETE /cajas/1.json
  def destroy
    @caja.destroy
    redirect_to cajas_url, notice: t('action.delete')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caja
      @caja = Caja.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def caja_params
      params.require(:caja).permit(:codigo, :nombre, :descripcion)
    end
end
