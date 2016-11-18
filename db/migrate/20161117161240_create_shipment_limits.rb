class CreateShipmentLimits < ActiveRecord::Migration[5.0]
  def change
    create_table :shipment_limits do |t|
    	t.integer :amount
    	t.string :user_type
      t.timestamps
    end
  end
end
