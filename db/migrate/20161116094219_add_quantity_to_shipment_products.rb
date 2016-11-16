class AddQuantityToShipmentProducts < ActiveRecord::Migration[5.0]
  def change
  	add_column :shipment_products, :quantity, :integer
  end
end
