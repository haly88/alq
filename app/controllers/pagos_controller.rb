class PagosController < ApplicationController
  before_action :set_pago, only: [:show, :edit, :update, :destroy]
  before_action :set_globales

  # GET /pagos
  # GET /pagos.json
  def index
    @pagos = Pago.all
  end

  # GET /pagos/1
  # GET /pagos/1.json
  def show
  end

  # GET /pagos/new
  def new
    @pago = Pago.new
    @pago.contrato_id = params[:contrato] if params[:contrato]
  end

  def refresh
    @pago = Pago.new(pago_params)
    set_contrato
    render :new 
  end

  # GET /pagos/1/edit
  def edit
  end

  # POST /pagos
  # POST /pagos.json
  def create
    @pago = Pago.new(pago_params)
    if @pago.save 
      redirect_to [:edit, @pago], notice: t('action.save')
    else
      render :new 
    end
  end

  # PATCH/PUT /pagos/1
  # PATCH/PUT /pagos/1.json
  def update
    if @pago.update(pago_params) 
      redirect_to [:edit, @pago], notice: t('action.update')
    else
      render :edit 
    end
  end

  # DELETE /pagos/1
  # DELETE /pagos/1.json
  def destroy
    @pago.destroy
    redirect_to pagos_url, notice: t('action.delete')
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_pago
    @pago = Pago.find(params[:id])
    @contrato = @pago.contrato
  end

  def set_globales
    @contratos = Contrato.order(:nombre)
    @empresa = Empresa.find(1)
    @impuestos = Impuesto.all
  end

  def set_contrato
    if @pago.contrato
      @contrato = @pago.contrato
      @contratos_item = @contrato.get_primer_cuota_cobrada(@pago.fecha)
      if @contratos_item
        @pago.contratos_item_id = @contratos_item.id 
        @pago.neto = @contratos_item.get_a_pagar
      end
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def pago_params
    params.require(:pago).permit(:contrato_id, :contratos_item_id, :propietario_id, :fecha, :neto, :descuento,
    :comision, :total)
  end
end
