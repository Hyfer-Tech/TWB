class AddTitleToShipments < ActiveRecord::Migration[5.0]
  def change
    add_column :shipments, :title, :string
  end
end
