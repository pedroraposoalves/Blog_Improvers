class ApplicationController < ActionController::Base
# Prevent CSRF attacks by raising an exception. 
# For APIs, you may want to use :null_session instead.


before_action :configure_permitted_parameters, if: :devise_controller?

protect_from_forgery

protected

def configure_permitted_parameters 
		devise_parameter_sanitizer.for(:sign_up)  << :name #{|user| user.permit(:name,:email,:password,:password_confirmation)} 

  			devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:name, :email) }
end

def authorize_blogger! 
	if user_signed_in? 
	return 
	elsif user_signed_in? 
	flash[:notice] = 'You must be an authorized blogger to do that' 
	redirect_to :root 
	else 
	flash[:notice] = 'You need to sign in first' 
	redirect_to new_user_session_path 
   end 
  end
 end