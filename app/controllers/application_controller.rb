class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def autenticacao
  	authenticate_or_request_with_http_basic do |usuario, senha|
  		usuario == 'admin' && senha == '600390'
  	end
  end
  
end
