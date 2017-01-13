class CreateAuditRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :audit_requests do |t|
      t.integer :agent_id
      t.integer :audit_id

      t.timestamps
    end
    add_index :audit_requests, :agent_id
    add_index :audit_requests, :audit_id
    add_index :audit_requests, [:audit_id, :agent_id]
    add_foreign_key :audit_requests, :audits
  end
end
