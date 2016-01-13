class ContratosController < ApplicationController
  before_action :set_contrato, only: [:show, :edit, :update, :destroy]
  before_action :set_selectores, only: [:new, :edit, :update, :create]
  before_action :set_inmuebles, only: [:edit, :update]
  before_action :set_inmuebles_sin_usar, only: [:new, :create]

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
      redirect_to [:edit, @contrato], notice: t('action.save')
    else
      render :new 
    end
  end

  # PATCH/PUT /contratos/1
  # PATCH/PUT /contratos/1.json
  def update
    if @contrato.update(contrato_params)
      redirect_to [:edit, @contrato], notice: t('action.update')
    else
      render :edit 
    end
  end

  # DELETE /contratos/1
  # DELETE /contratos/1.json
  def destroy
    if @contrato.destroy
      redirect_to contratos_url, notice: t('action.delete')
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contrato
      @contrato = Contrato.find(params[:id])
    end

    def set_selectores
      @impuestos = Impuesto.all
      @inquilinos = Persona.inquilinos
      @propietarios = Persona.propietarios
      @garantes = Persona.garantes
    end

    def set_inmuebles
      @inmuebles = Inmueble.all
    end

    def set_inmuebles_sin_usar
      @inmuebles = Inmueble.sin_usar
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contrato_params
      params.require(:contrato).permit(:nombre, :descripcion, :carpeta, :fecha, :inmueble_id,
      :inquilino_ids => [], :propietario_ids => [], :garante_ids => [],
      contratos_items_attributes: [:id, :fecha_desde, :monto, :_destroy],
      contratos_impuestos_attributes: [:id, :fecha_pago, :impuesto_id, :monto, :pago, :_destroy])
    end
end
