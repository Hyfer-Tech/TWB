class AddBusinessUserIdToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :business_user_id, :integer
    add_column :products, :shipment_id, :integer

    add_index :products, :business_user_id
    add_index :products, :shipment_id
  end
end
