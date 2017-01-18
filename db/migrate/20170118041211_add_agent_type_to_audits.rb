class AddAgentTypeToAudits < ActiveRecord::Migration[5.0]
  def change
    add_column :audit_requests, :agent_type, :string
  end
end
