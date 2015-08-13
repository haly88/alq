class ContratosController < ApplicationController
  before_action :set_contrato, only: [:show, :edit, :update, :destroy]

  # GET /contratos
  # GET /contratos.json
  def index
    @contratos = Contrato.all
  end

  # GET /contratos/1
  # GET /contratos/1.json
  def show
  end

  # GET /contratos/new
  def new
    @contrato = Contrato.new
    1.times do
      contratos_item = @contrato.contratos_items.build
    end
  end

  # GET /contratos/1/edit
  def edit
  end

  # POST /contratos
  # POST /contratos.json
  def create
    @contrato = Contrato.new(contrato_params)
    if @contrato.save
      redirect_to @contrato, notice: 'Guardado.'
    else
      render :new 
    end
  end

  # PATCH/PUT /contratos/1
  # PATCH/PUT /contratos/1.json
  def update
    if @contrato.update(contrato_params)
      redirect_to [:edit, @contrato], notice: 'Actualizado.' 
    else
      render :edit 
    end
  end

  # DELETE /contratos/1
  # DELETE /contratos/1.json
  def destroy
    @contrato.destroy
    redirect_to contratos_url, notice: 'Borrado.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contrato
      @contrato = Contrato.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contrato_params
      params.require(:contrato).permit(:codigo, :nombre, :activo, :descripcion, :carpeta, :fecha, :inmueble_id,
      :inquilino_ids => [], :propietario_ids => [], :garante_ids => [],
      contratos_items_attributes: [:id, :monto, :fecha_desde, :fecha_hasta, :_destroy])
    end
end
