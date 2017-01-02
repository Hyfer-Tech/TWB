class AddZipPostalCodeToBusinessUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :business_users, :zip_postal_code, :string
  end
end
