module Messagable
  extend ActiveSupport::Concern

  included do
    has_many :chat_rooms, as: :user, dependent: :destroy
    has_many :chat_rooms, as: :member, dependent: :destroy
    has_many :messages, as: :user, dependent: :destroy
    has_many :messaged_users, through: :chat_rooms, source: :user, source_type: "ChatRooms"
    has_many :messaged_members, through: :chat_rooms, source: :member
  end

  def chat_rooms
    ChatRoom.where("member_id = ? or user_id = ?", id, id)    
  end
end
