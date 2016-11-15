module ApplicationHelper
  def current_user
    current_broker || current_business_user || current_forward_freight || nil
  end
end
