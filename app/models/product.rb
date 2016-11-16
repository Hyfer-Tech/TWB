class Product < ApplicationRecord
	belongs_to :business_user
	has_many :shipment_products
	has_many :shipments, through: :shipment_products
end
