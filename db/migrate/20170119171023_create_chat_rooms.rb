class CreateChatRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :chat_rooms do |t|
      t.string :title
      t.integer :user_id, index: true
      t.integer :member_id, index: true

      t.timestamps
    end    
  end
end
