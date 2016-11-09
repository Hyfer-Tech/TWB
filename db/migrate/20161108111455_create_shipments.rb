class CreateShipments < ActiveRecord::Migration[5.0]
  def change
    create_table :shipments do |t|
    	t.integer :quantity
    	t.integer :broker_id
    	t.integer :forward_freight_id
    	

      t.timestamps
    end
  end
end
