class AddColumnToBusinessUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :business_users, :avatar, :string
  end
end
