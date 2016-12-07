class AddUserTypeToUploads < ActiveRecord::Migration[5.0]
  def change
    add_column :uploads, :user_type, :integer
  end
end
