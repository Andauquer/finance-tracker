class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #Lo que hace esta linea de codigo es establecer en nuestra aplicacion que para realizar cualquier accion
  #primero necesitamos un usuario logeado.
  before_action :authenticate_user!
end
