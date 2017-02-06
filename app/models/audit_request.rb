class AuditRequest < ApplicationRecord
  belongs_to :audit
  belongs_to :agent, polymorphic: true, foreign_key: "agent_id"

  enum status: [:pending, :rejected, :approved]

  validates :audit, :agent, presence: true
  validates :audit_id, uniqueness: { scope: [:agent_id, :agent_type] }

  delegate :first_name, :last_name, :avatar, :description, :city, to: :agent, prefix: true

  def approve!
    update(status: :approved)
  end

  def reject!
    update(status: :rejected)
  end

  scope :pending_count, -> () {where(status: :pending).count}
end
