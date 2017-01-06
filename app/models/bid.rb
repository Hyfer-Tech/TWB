class Bid < ApplicationRecord
  belongs_to :job
  belongs_to :bidder, polymorphic: true
  belongs_to :shipment

  validates :bidder_id, :job_id, :bidder_type, :cover_letter, :price, presence: true

  delegate :client, to: :job
  
  delegate :email, :business_name, :first_name, :last_name, :phone, :description, :address_line_1, :address_line_2, :address_line_3, :city, :state_province_county, :country, :avatar, :account_type, :zip_postal_code, to: :client, prefix: true
  delegate :avatar, :description, :past_experience, :firm_name, to: :bidder, prefix: true

  scope :this_month, -> {where(created_at: (Time.now.beginning_of_month..Time.zone.now))}

  def toggle_accept!(status)
  	self.accepted = !status
    self.save  	
  end

  def assign_agent!
    self.job.agent_id = accepted ? bidder.id : nil
    self.job.agent_type = accepted ? bidder.class.name : nil
    self.job.save
  end


  def client_business_name
  	client.business_name
  end
end
