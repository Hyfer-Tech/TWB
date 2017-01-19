class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :body
      t.integer :user_id, index: true
      t.references :chat_room, index: true

      t.timestamps
    end
  end
end
