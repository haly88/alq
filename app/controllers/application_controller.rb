class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :autorizado

  private

  def current_user
    @current_user ||= Usuario.find(session[:usuario_id]) if session[:usuario_id]
  end
  helper_method :current_user
  
  def autorizado
    redirect_to new_sesion_path, alert: "Necesita logear primero" if current_user.nil?
  end
end
