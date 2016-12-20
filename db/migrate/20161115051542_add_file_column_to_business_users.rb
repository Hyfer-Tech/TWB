class AddFileColumnToBusinessUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :business_users, :files, :string
  end
end
