class DeviseDecorator < Draper::Decorator
  delegate_all

  def self.assign_user
  	if business_user_signed_in?
      current_business_user
    elsif forward_freight_signed_in?
      current_forward_freight
    else
      current_broker
    end
  end

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
