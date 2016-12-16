class ChangeUserIdsToClientIdsForJobs < ActiveRecord::Migration[5.0]
  def change
 	remove_column :jobs, :business_user_id
 	remove_column :jobs, :broker_id
 	remove_column :jobs, :forward_freight_id

 	add_column :jobs, :client_id, :integer
 	add_column :jobs, :agent_id, :integer

 	add_index :jobs, :client_id
 	add_index :jobs, :agent_id
 	add_index :jobs, [:client_id, :agent_id]
  end
end
