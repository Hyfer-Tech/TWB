class RemoveQuantityFromShipments < ActiveRecord::Migration[5.0]
  def change
    remove_column :shipments, :quantity, :integer
  end
end
