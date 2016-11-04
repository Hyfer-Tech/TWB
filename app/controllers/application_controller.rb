class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters_for_broker
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password, :password_confirmation, :description, :phone, :address_line_1, :address_line_2, :address_line_3, :city, :zip_or_postcode, :state_province_county, :country])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :password, :password_confirmation, :description, :phone, :address_line_1, :address_line_2, :address_line_3, :city, :zip_or_postcode, :state_province_county, :country])
  end
end
