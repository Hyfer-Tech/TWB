class Shipment < ApplicationRecord
	belongs_to :business_user
	has_many :shipment_products
	has_many :products, through: :shipment_products
	accepts_nested_attributes_for :shipment_products, reject_if: :all_blank, allow_destroy: true

	scope :this_month, -> {where(created_at: (Time.now.beginning_of_month..Time.zone.now))}

	# validate :check_user_quota
	validates :business_user_id, presence: true
	validates :shipment_products, length: {minimum: 1}

	has_one :job

	private

	def check_user_quota
		# return if business_user.premium_account?
		# if business_user.shipments.this_month.count >= UserLimit.find_by(user_type: BusinessUser.class.name.underscore).amount
		#  	errors.add(:base, "Exceeds monthly limit")
		# end
	end
end
