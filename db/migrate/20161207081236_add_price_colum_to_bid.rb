class AddPriceColumToBid < ActiveRecord::Migration[5.0]
  def change
    unless column_exists? :bids, :price
      add_column :bids, :price, :float
    end
  end
end
