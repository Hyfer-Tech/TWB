class ChangeZipColumnToString < ActiveRecord::Migration[5.0]
  def change
    change_column :forward_freights, :zip_postal_code, :string
  end
end
