class Product < ApplicationRecord
	belongs_to :business_user
	has_many :shipment_products
	has_many :shipments, through: :shipment_products

	validates :title, :taxable, :featured_image, :price, :compare_at_price, :product_code, :height, :width, :grams, :business_user_id, presence: true
end

 t.string   "title"
    t.boolean  "taxable"
    t.string   "featured_image"
    t.boolean  "available"
    t.string   "price"
    t.string   "compare_at_price"
    t.bigint   "product_code"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "business_user_id"
    t.integer  "shipment_id"
    t.float    "height"
    t.float    "width"
    t.float    "grams"