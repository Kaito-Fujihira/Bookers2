class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(resource)
      if current_user
        flash[:notice] = "Signed in successfully." 
        user_path(current_user.id)  #　指定したいパスに変更
      else
        flash[:notice] = "Welcome! You have signed up successfully." 
        user_path(current_user.id)  #　指定したいパスに変更
      end
  end


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
