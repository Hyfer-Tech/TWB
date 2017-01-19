class ChatRoom < ApplicationRecord
  belongs_to :user, foreign_key: "user_id", polymorphic: true
  belongs_to :member, foreign_key: "member_id", polymorphic: true
  has_many :messages, dependent: :destroy

  scope :most_recent, -> {order(updated_at: :desc).first}

  def self.room_with(user, member)
    all.where(user: user, member: member).first ||  all.where(user: member, member: user).first
  end
end
