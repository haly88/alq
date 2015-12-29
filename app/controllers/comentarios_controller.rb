class ComentariosController < ApplicationController
	before_action :set_comentable

  def index
  	@comentarios = @comentable.comentarios
    @comentario = @comentable.comentarios.new
  end

   def new
    @comentario = @comentable.comentarios.new
  end

  # POST /locations
  # POST /locations.json
  def create
    @comentario = @comentable.comentarios.new(comentario_params)
    if @comentario.save
      redirect_to [@comentable, :comentarios], notice: t('action.save')
    else
      render :new 
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
