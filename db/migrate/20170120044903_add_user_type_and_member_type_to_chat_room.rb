class AddUserTypeAndMemberTypeToChatRoom < ActiveRecord::Migration[5.0]
  def change
    add_column :chat_rooms, :user_type, :string
    add_column :chat_rooms, :member_type, :string
  end
end
