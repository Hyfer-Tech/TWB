class Product < ApplicationRecord
	belongs_to :business_user
	has_many :shipment_products
	has_many :shipments, through: :shipment_products

	validates :title, :taxable, :featured_image, :price, :compare_at_price, :product_code, :height, :width, :grams, :business_user_id, presence: true
end
