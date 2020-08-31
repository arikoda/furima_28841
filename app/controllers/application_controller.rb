class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

    def configure_permitted_parameters
      added_attrs = [ :family_name, :first_name, :nickname, :family_n_ruby, :first_n_ruby, :birthday ]        
      devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
      devise_parameter_sanitizer.permit(:sign_in)
      devise_parameter_sanitizer.permit(:acount_update, keys: added_attrs)
    end
end

