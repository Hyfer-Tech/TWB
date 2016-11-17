class Product < ApplicationRecord
	belongs_to :business_user
	has_many :shipment_products
	has_many :shipments, through: :shipment_products

  mount_uploader :featured_image, ProductUploader
end
