class AddBusinessUserIdToShipments < ActiveRecord::Migration[5.0]
  def change
    add_column :shipments, :business_user_id, :integer
    add_index :shipments, :business_user_id
  end
end
