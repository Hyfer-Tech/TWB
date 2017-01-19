class AddUserTypeToMessage < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :user_type, :string
  end
end
