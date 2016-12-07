class Upload < ApplicationRecord
  belongs_to :user, polymorphic: true, foreign_key: "user_id"

  mount_uploader :file, FileUploader

  validates :user_id, :file, presence: true
end
