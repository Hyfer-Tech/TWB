class Bid < ApplicationRecord
  belongs_to :job
  belongs_to :bidder, polymorphic: true
  belongs_to :shipment

  validates :bidder_id, :job_id, :bidder_type, :cover_letter, :price, presence: true

  delegate :client, to: :job

  scope :this_month, -> {where(created_at: (Time.now.beginning_of_month..Time.zone.now))}

  def toggle_accept(status)
    update(accepted: !status)
  end

  def client_business_name
  	client.business_name
  end
end
