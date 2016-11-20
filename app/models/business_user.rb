class BusinessUser < ApplicationRecord
  # has_many :taggings, as: :taggable
  # has_many :tag, through: :taggings
  
  acts_as_taggable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :avatar, AvatarUploader

end
