module UsersHelper
  def assign_user
    if business_user_signed_in?
      current_business_user
    elsif forward_freight_signed_in?
      current_forward_freight
    else
      current_broker
    end
  end

  def edit_profile(user)
    if business_user_signed_in?
      edit_business_user_registration_path(user)
    elsif forward_freight_signed_in?
      edit_forward_freight_registration_path(user)
    else
      edit_broker_registration_path(user)
    end
  end

  def address_line
    "#{assign_user.address_line_1}, #{assign_user.address_line_2}, #{assign_user.address_line_3}" if assign_user.address_line_2.present?
    "#{assign_user.address_line_1}, #{assign_user.address_line_3}" if assign_user.address_line_2.present?
  end

end
