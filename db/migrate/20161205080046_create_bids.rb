class CreateBids < ActiveRecord::Migration[5.0]
  def change
    create_table :bids do |t|
      t.integer :broker_id
      t.integer :job_id
      t.boolean :accepted, default: false
      t.string :cover_letter
      t.string :attachment
      t.timestamps
    end

    add_index :bids, :broker_id
    add_index :bids, :job_id
    add_index :bids, [:broker_id, :accepted]
    add_index :bids, [:job_id, :accepted]
  end
end
