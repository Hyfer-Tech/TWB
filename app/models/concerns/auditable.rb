module Auditable
  extend ActiveSupport::Concern

  included do
    has_many :feedbacks, as: :agent
    has_many :audit_requests, as: :agent
    has_many :audits, through: :audit_requests
  end

  def feedback_for(audit)
    feedbacks.find_by(audit: audit)
  end

  def audit_request_for(audit)
    audit_requests.find_by(audit: audit)
  end

  def has_approved_audit_request_for?(audit)
    audit_requests.where(audit: audit, status: :approved).any?
  end
end
