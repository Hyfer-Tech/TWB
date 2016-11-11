module UsersHelper
  # def user
  #   if business_user_signed_in?
  #     current_business_user
  #   elsif forward_freight_signed_in?
  #     current_forward_freight
  #   else
  #     current_broker
  #   end
  # end

  def edit(user)
    if business_user_signed_in?
      edit_business_user_registration_path(user)
    elsif forward_freight_signed_in?
      edit_forward_freight_registration_path(user)
    else
      edit_broker_registration_path(user)
    end
  end

  def address_line
    "#{user.address_line_1}, #{user.address_line_2}, #{user.address_line_3}" if user.address_line_2.present?
    "#{user.address_line_1}, #{user.address_line_3}" if user.address_line_2.present?
  end

end
