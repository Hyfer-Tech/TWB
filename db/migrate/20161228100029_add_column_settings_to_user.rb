class AddColumnSettingsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :business_users, :settings, :jsonb, null: false, default: {}
    add_column :forward_freights, :settings, :jsonb, null: false, default: {}
    add_column :brokers, :settings, :jsonb, null: false, default: {}
  end
end
