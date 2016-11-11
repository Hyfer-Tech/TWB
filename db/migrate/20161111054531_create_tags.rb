class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string :tag 
      t.integer :taggable_id
      t.string :taggable_type
      t.timestamps
    end
  end
end
