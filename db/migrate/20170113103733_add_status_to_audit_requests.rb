class AddStatusToAuditRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :audit_requests, :status, :integer, default: 0, null: false
  end
end
