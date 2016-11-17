class Shipment < ApplicationRecord
	belongs_to :business_user
	has_many :shipment_products
	has_many :products, through: :shipment_products
	accepts_nested_attributes_for :shipment_products, reject_if: :all_blank, allow_destroy: true
end