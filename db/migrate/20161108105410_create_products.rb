class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
    	
    	t.string :title
    	t.boolean :taxable
    	t.string :featured_image
    	t.boolean :available
    	t.string :price
    	t.integer :grams
    	t.string :compare_at_price
    	t.bigint :product_id

      t.timestamps
    end
  end
end
