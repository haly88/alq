class SesionesController < ApplicationController

  skip_before_filter :autorizado

  def new
  end
  
  def create
    usuario = Usuario.find_by_email(params[:email])
    if usuario && usuario.authenticate(params[:password])
      session[:usuario_id] = usuario.id
      redirect_to root_url, notice: "Bienvenido #{usuario.email}"
    else
      redirect_to new_sesion_path, notice: "Email o Password Incorrectos!"
    end
  end
  
  def destroy
    session[:usuario_id] = nil
    redirect_to new_sesion_path, notice: "Secion Cerrada!"
  end
end
