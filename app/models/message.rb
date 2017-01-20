class Message < ApplicationRecord
  belongs_to :user, polymorphic: true, foreign_key: "user_id"
  belongs_to :chat_room, touch: true

  validates :body, presence: true
  after_create_commit { MessageBroadcastJob.perform_later(self) }

  delegate :avatar, to: :user, prefix: true

  def timestamp
    created_at.strftime('%-m/%d %H:%M:%S')
  end
end
