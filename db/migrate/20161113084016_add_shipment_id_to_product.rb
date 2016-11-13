class AddShipmentIdToProduct < ActiveRecord::Migration[5.0]
  def change
	add_column :products, :shipment_id, :integer, :null => false, :default => 0
  end
end
