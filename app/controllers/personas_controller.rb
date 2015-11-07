class PersonasController < ApplicationController
  before_action :set_persona, only: [:show, :edit, :update, :destroy]

  # GET /personas
  # GET /personas.json
  def index
    @personas = Persona.all
  end

  # GET /personas/1
  # GET /personas/1.json
  def show
  end

  # GET /personas/new
  def new
    @persona = Persona.new
  end

  # GET /personas/1/edit
  def edit
  end

  # POST /personas
  # POST /personas.json
  def create
    @persona = Persona.new(persona_params)
    if @persona.save
      redirect_to @persona, notice: t('action.save')
    else
      render :new
    end
  end

  # PATCH/PUT /personas/1
  # PATCH/PUT /personas/1.json
  def update
    if @persona.update(persona_params)
      redirect_to @persona, notice: t('action.update')
    else
      render :edit
    end
  end

  # DELETE /personas/1
  # DELETE /personas/1.json
  def destroy
    @persona.destroy
    redirect_to personas_url, notice: t('action.delete')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_persona
      @persona = Persona.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def persona_params
      params.require(:persona).permit(:codigo, :nombre, :activo, :descripcion, :es_inquilino, :es_propietario, :es_garante, :es_otro, :telefono, :email, :direccion)
    end
end
