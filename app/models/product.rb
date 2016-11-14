class Product < ApplicationRecord
	has_many :shipment_products
	has_many :shipments, through: :shipment_product
	belongs_to :business_user
end
