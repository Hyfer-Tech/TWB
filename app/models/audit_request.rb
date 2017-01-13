class AuditRequest < ApplicationRecord
  belongs_to :audit
  belongs_to :agent, polymorphic: true, foreign_key: "agent_id"

  enum status: [:pending, :rejected, :approved]

  def approve!
    update(status: :approved)
  end

  def reject!
    update(status: :rejected)
  end
end
