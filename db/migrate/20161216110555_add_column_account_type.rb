class AddColumnAccountType < ActiveRecord::Migration[5.0]
  def change
    add_column :brokers, :account_type, :integer
    add_column :forward_freights, :account_type, :integer
  end
end
