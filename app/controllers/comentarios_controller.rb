class ComentariosController < ApplicationController
	before_action :set_comentable

  def index
  	@comentarios = @comentable.comentarios
    @comentario = Comentario.new
  end

  def new
    @comentario = @comentable.comentarios.new
  end

  # POST /locations
  # POST /locations.json
  def create
    @comentario = @comentable.comentarios.new(comentario_params)
    respond_to do |format|
      if @comentario.save
        format.html { redirect_to [@comentable, :comentarios], notice: t('action.save') }
        format.js
      else
        format.html { render :new }
        format.js
      end
    end
  end

  def destroy
    @comentario = @comentable.comentarios.find(params[:id])
    @comentario.destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def set_comentable
  	resource, id = request.path.split('/')[1,2]
  	@comentable = resource.singularize.classify.constantize.find(id)
  end

  def comentario_params
    params.require(:comentario).permit(:descripcion)
   end
end
