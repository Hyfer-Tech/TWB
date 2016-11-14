class Shipment < ApplicationRecord
	belongs_to :business_user
	has_many :products
	accepts_nested_attributes_for :products, reject_if: :all_blank, allow_destroy: true
end
