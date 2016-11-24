class AddDetailsToProducts < ActiveRecord::Migration[5.0]
  def change
  	add_column :products, :height, :float
  	add_column :products, :width, :float
  	remove_column :products, :grams, :integer
  end
end
