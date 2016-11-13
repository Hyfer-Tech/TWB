class RemoveShipmentIdFromProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :shipment_id, :integer
  end
end
