class AddIndexToProducts < ActiveRecord::Migration[5.0]
  def change
  	add_index :products, :shipment_id
  	add_index :shipments, :broker_id
  end
end
