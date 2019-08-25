class ApplicationController < ActionController::Base
protect_from_forgery with: :exception

before_action :configure_permitted_parameters, if: :devise_controller?

protected

def configure_permitted_parameters
	devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :phone, :dob_month, :dob_day, :dob_year, :profile, :password, :password_confirmation] )
	devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :phone, :dob_month, :dob_day, :profile, :dob_year, :password, :password_confirmation, :current_password ])
end

end
