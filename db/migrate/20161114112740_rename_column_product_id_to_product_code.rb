class RenameColumnProductIdToProductCode < ActiveRecord::Migration[5.0]
  def change
  	rename_column :products, :product_id, :product_code
  end
end
