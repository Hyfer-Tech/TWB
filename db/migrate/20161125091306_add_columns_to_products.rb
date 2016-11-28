class AddColumnsToProducts < ActiveRecord::Migration[5.0]
  def change
  	add_column :products, :origin_of_manufacture, :string
  	add_column :products, :materials_used, :string
  	add_column :products, :date_of_manufacture, :datetime
  end
end
