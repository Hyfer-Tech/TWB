class AddPriceToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :price, :decimal
  end
end
