class Broker < ApplicationRecord
  include Searchable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :avatar, AvatarUploader

  acts_as_followable
  acts_as_follower
end
