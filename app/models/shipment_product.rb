class ShipmentProduct < ApplicationRecord
	belongs_to :shipment
	belongs_to :product

	validates :product_id, :quantity, presence: true
	validates :quantity, numericality: { greater_than: 0 }
end
