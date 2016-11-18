class ChangeZipToString < ActiveRecord::Migration[5.0]
  def change
    change_column :brokers, :zip_postal_code, :string
  end
end
