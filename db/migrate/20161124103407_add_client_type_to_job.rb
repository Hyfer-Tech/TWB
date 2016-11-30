class AddClientTypeToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :client_type, :string
    add_column :jobs, :agent_type, :string
  end
end
