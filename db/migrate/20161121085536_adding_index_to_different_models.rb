class AddingIndexToDifferentModels < ActiveRecord::Migration[5.0]
  def change
  	add_index :shipment_products, :product_id
  	add_index :shipment_products, :shipment_id
  	add_index :shipments, :forward_freight_id
  end
end
