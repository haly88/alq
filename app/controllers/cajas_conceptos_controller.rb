class CajasConceptosController < ApplicationController
  before_action :set_cajas_concepto, only: [:show, :edit, :update, :destroy]

  # GET /cajas_conceptos
  # GET /cajas_conceptos.json
  def index
    @cajas_conceptos = CajasConcepto.all
  end

  # GET /cajas_conceptos/1
  # GET /cajas_conceptos/1.json
  def show
  end

  # GET /cajas_conceptos/new
  def new
    @cajas_concepto = CajasConcepto.new
  end

  # GET /cajas_conceptos/1/edit
  def edit
  end

  # POST /cajas_conceptos
  # POST /cajas_conceptos.json
  def create
    @cajas_concepto = CajasConcepto.new(cajas_concepto_params)
    if @cajas_concepto.save
      redirect_to [:edit, @cajas_concepto], notice: t('action.save')
    else
      render :new 
    end
  end

  # PATCH/PUT /cajas_conceptos/1
  # PATCH/PUT /cajas_conceptos/1.json
  def update
    if @cajas_concepto.update(cajas_concepto_params)
      redirect_to [:edit, @cajas_concepto], notice: t('action.update')
    else
      render :edit
    end
  end

  # DELETE /cajas_conceptos/1
  # DELETE /cajas_conceptos/1.json
  def destroy
    if @cajas_concepto.destroy
      redirect_to cajas_conceptos_url, notice: t('action.delete')
    else
      render :edit
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cajas_concepto
      @cajas_concepto = CajasConcepto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cajas_concepto_params
      params.require(:cajas_concepto).permit(:codigo, :nombre, :descripcion)
    end
end
