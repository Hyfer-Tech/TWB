class AddGramsToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :grams, :float
  end
end
