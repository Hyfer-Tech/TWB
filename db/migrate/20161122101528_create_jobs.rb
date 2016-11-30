 class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
    	t.integer :business_user_id
    	t.integer :broker_id
    	t.integer :job_type
    	t.integer :shipment_id
      t.integer :forward_freight_id
      t.timestamps
    end

    add_index :jobs, :business_user_id
    add_index :jobs, :broker_id
    add_index :jobs, :shipment_id
    add_index :jobs, :forward_freight_id
  end
end
