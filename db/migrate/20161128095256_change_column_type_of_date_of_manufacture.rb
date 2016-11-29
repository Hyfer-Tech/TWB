class ChangeColumnTypeOfDateOfManufacture < ActiveRecord::Migration[5.0]
  def change
  		remove_column :products, :date_of_manufacture
  		add_column :products, :date_of_manufacture, :date
  end
end
