class ChangeDateOfManufactureColumnToTypeString < ActiveRecord::Migration[5.0]
  def change
  	change_column :products, :date_of_manufacture, :string
  end
end
