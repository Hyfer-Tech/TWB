class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.integer :total_rate
      t.string :rate_type #rate belongs to me or other model

      t.timestamps
    end
  end
end
