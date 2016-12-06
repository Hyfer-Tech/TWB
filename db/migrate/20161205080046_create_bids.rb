class CreateBids < ActiveRecord::Migration[5.0]
  def change
    create_table :bids do |t|
      t.integer :bidder_id
      t.integer :job_id
      t.string :bidder_type
      t.boolean :accepted, default: false
      t.text :cover_letter
      t.string :attachment
      t.timestamps
    end

    add_index :bids, :bidder_id
    add_index :bids, :job_id
    add_index :bids, [:bidder_id, :accepted]
    add_index :bids, [:job_id, :accepted]
  end
end
