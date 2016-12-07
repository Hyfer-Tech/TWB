class AddPriceColumToBid < ActiveRecord::Migration[5.0]
  def change
    add_column :bids, :price, :float
  end
end
