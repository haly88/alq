class ImpuestosController < ApplicationController
  before_action :set_impuesto, only: [:show, :edit, :update, :destroy]

  # GET /impuestos
  # GET /impuestos.json
  def index
    @impuestos = Impuesto.all
  end

  # GET /impuestos/1
  # GET /impuestos/1.json
  def show
  end

  # GET /impuestos/new
  def new
    @impuesto = Impuesto.new
  end

  # GET /impuestos/1/edit
  def edit
  end

  # POST /impuestos
  # POST /impuestos.json
  def create
    @impuesto = Impuesto.new(impuesto_params)
    if @impuesto.save
      redirect_to @impuesto, notice: t('action.save')
    else
      render :new 
    end
  end

  # PATCH/PUT /impuestos/1
  # PATCH/PUT /impuestos/1.json
  def update
    if @impuesto.update(impuesto_params)
      redirect_to @impuesto, notice: t('action.update')
    else
      render :edit
    end
  end

  # DELETE /impuestos/1
  # DELETE /impuestos/1.json
  def destroy
    @impuesto.destroy
    redirect_to impuestos_url, notice: t('action.delete')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_impuesto
      @impuesto = Impuesto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def impuesto_params
      params.require(:impuesto).permit(:codigo, :nombre, :descripcion, :cantidad_meses_defecto)
    end
end
