class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def authenticate_any!
    if broker_signed_in?
        true
    elsif forward_freight_signed_in?
        true
    else
        authenticate_business_user!
    end
  end

  def current_user
    current_broker || current_business_user || current_forward_freight || nil
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password, :password_confirmation, :description, :phone, :address_line_1, :address_line_2, :address_line_3, :city, :zip_postal_code, :state_province_county, :country, :firm_name, :specialty, :past_experience, :service_rates, :avatar, :broker_number, :business_name, :tag_list ])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :password, :password_confirmation, :description, :phone, :address_line_1, :address_line_2, :address_line_3, :city, :zip_postal_code, :state_province_county, :country, :firm_name, :specialty, :past_experience, :service_rates, :avatar, :broker_number, :business_name, :tag_list  ])
  end
end
