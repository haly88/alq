class InmueblesController < ApplicationController
  before_action :set_inmueble, only: [:show, :edit, :update, :destroy]
  before_action :set_inmueble_tipo, only: [:new, :create, :edit, :update]

  # GET /inmuebles
  # GET /inmuebles.json
  def index
    @inmuebles = Inmueble.all
  end

  # GET /inmuebles/1
  # GET /inmuebles/1.json
  def show
  end

  # GET /inmuebles/new
  def new
    @inmueble = Inmueble.new
  end

  # GET /inmuebles/1/edit
  def edit
  end

  # POST /inmuebles
  # POST /inmuebles.json
  def create
    @inmueble = Inmueble.new(inmueble_params)
    if @inmueble.save
      redirect_to [:edit, @inmueble], notice: t('action.save')
    else
      render :new
    end
  end

  # PATCH/PUT /inmuebles/1
  # PATCH/PUT /inmuebles/1.json
  def update
    if @inmueble.update(inmueble_params)
      redirect_to [:edit, @inmueble], notice: t('action.update')
    else
      render :edit
    end
  end

  # DELETE /inmuebles/1
  # DELETE /inmuebles/1.json
  def destroy
    if @inmueble.destroy
      redirect_to inmuebles_url, notice: t('action.delete')
    else
      render :edit 
    end
  end

  private

    def set_inmueble_tipo
      @inmueble_tipo = InmuebleTipo.all
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_inmueble
      @inmueble = Inmueble.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inmueble_params
      params.require(:inmueble).permit(:codigo, :descripcion, :inmueble_tipo_id, :direccion, :piso, :depto, :localidad, 
        :administracion, :adm_email, :adm_tel1, :adm_tel2, :adm_tel3, :encargado, :enc_email, :enc_tel1, 
        :enc_tel2, :enc_tel3)
    end
end
