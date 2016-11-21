class RemoveUnnecessaryUserIdColumnsFromShipments < ActiveRecord::Migration[5.0]
  def change
    remove_columns :shipments, :broker_id
    remove_columns :shipments, :forward_freight_id
  end
end
