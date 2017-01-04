module MessagesHelper
  def recipients_options
    s = ''
    users = BusinessUser.all + Broker.all + ForwardFreight.all
    users.each do |user|
      s << "<option value='#{user.id}'>#{user.first_name}</option>"
    end
    s.html_safe
  end
end
