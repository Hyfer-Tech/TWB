class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def authenticate_broker_or_forward_freight
    return if broker_signed_in? || forward_freight_signed_in?
    flash[:alert] = "Please sign in."
    redirect_to root_path
  end

  def authenticate_any!
    return true if broker_signed_in? || forward_freight_signed_in? || business_user_signed_in?
    flash[:alert] = "Please sign in."
    redirect_to root_path
  end

  def current_user
    current_broker || current_business_user || current_forward_freight || nil
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password, :password_confirmation, :description, :phone, :address_line_1, :address_line_2, :address_line_3, :city, :zip_postal_code, :state_province_county, :country, :firm_name, :specialty, :past_experience, :service_rates, :avatar, :broker_number, :business_name ])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :password, :password_confirmation, :description, :phone, :address_line_1, :address_line_2, :address_line_3, :city, :zip_postal_code, :state_province_county, :country, :firm_name, :specialty, :past_experience, :service_rates, :avatar, :broker_number, :business_name, :show_email, :show_phone_number, :tag_list =>[] ])
  end
end
