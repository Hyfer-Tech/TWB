class AddAccountTypeToBusinessUser < ActiveRecord::Migration[5.0]
  def change
    add_column :business_users, :account_type, :integer
  end
end
