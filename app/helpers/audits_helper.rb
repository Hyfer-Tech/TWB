module AuditsHelper
  def audit_tag_list(audit)
    a = audit.business_user.tag_list
    a.each do |aa|
      content_for(:p, a)
    end
  end
end
