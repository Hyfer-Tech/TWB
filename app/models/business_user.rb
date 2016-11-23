class BusinessUser < ApplicationRecord
  include Searchable
  acts_as_taggable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  mount_uploader :avatar, AvatarUploader
  mount_uploader :files, FilesUploader

  acts_as_follower
  acts_as_followable
end
