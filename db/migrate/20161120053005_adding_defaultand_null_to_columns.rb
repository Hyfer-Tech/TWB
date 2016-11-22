class AddingDefaultandNullToColumns < ActiveRecord::Migration[5.0]
  def change
  	change_column :brokers, :verified_flag, :boolean, null: false, default: false
  	change_column :products, :taxable, :boolean, null: false, default: false
  	change_column :products, :available, :boolean, null: false, default: false
  	change_column :shipments, :approval, :boolean, null: false, default: false
  	change_column :shipments, :shipment_confirmed, :boolean, null: false, default: false

  end
end
