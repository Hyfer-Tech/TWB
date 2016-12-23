class Bid < ApplicationRecord
  belongs_to :job
  belongs_to :bidder, polymorphic: true
  belongs_to :shipment

  validates :bidder_id, :job_id, :bidder_type, :cover_letter, :price, presence: true

  delegate :client_first_name, :client_email, to: :job, prefix: 'job'

  scope :this_month, -> {where(created_at: (Time.now.beginning_of_month..Time.zone.now))}
  def toggle_accept(status)
    update(accepted: !status)
  end
end
