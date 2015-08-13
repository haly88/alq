class ContratosItemsController < ApplicationController
  before_action :set_contratos_item, only: [:show, :edit, :update, :destroy]

  # GET /contratos_items
  # GET /contratos_items.json
  def index
    @contratos_items = ContratosItem.all
  end

  # GET /contratos_items/1
  # GET /contratos_items/1.json
  def show
  end

  # GET /contratos_items/new
  def new
    @contratos_item = ContratosItem.new
  end

  # GET /contratos_items/1/edit
  def edit
  end

  # POST /contratos_items
  # POST /contratos_items.json
  def create
    @contratos_item = ContratosItem.new(contratos_item_params)

    respond_to do |format|
      if @contratos_item.save
        format.html { redirect_to @contratos_item, notice: 'Guardado.' }
        format.json { render :show, status: :created, location: @contratos_item }
      else
        format.html { render :new }
        format.json { render json: @contratos_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contratos_items/1
  # PATCH/PUT /contratos_items/1.json
  def update
    respond_to do |format|
      if @contratos_item.update(contratos_item_params)
        format.html { redirect_to @contratos_item, notice: 'Actualizado.' }
        format.json { render :show, status: :ok, location: @contratos_item }
      else
        format.html { render :edit }
        format.json { render json: @contratos_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contratos_items/1
  # DELETE /contratos_items/1.json
  def destroy
    @contratos_item.destroy
    respond_to do |format|
      format.html { redirect_to contratos_items_url, notice: 'Borrado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contratos_item
      @contratos_item = ContratosItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contratos_item_params
      params.require(:contratos_item).permit(:contrato_id, :fecha_desde, :fecha_hasta, :monto)
    end
end
