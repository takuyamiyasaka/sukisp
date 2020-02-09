class ApplicationController < ActionController::Base
  before_action  :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(resource)
  	if admin_signed_in?
       admins_genres_path
    else
       root_path
    end
  end

  def after_sign_up_path_for(resource)
   	  if admin_signed_up?
   	  	admin_top_path
   	  else
   	  	root_path
   	  end
  end

 protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,  keys: [:name, :public_name, :email])
    #devise_parameter_sanitizer.permit(:sign_in,  keys: [:password])
  end
end
