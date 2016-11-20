class BusinessUser < ApplicationRecord  
  acts_as_taggable
  include Searchable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         

  mount_uploader :avatar, AvatarUploader

  acts_as_follower
  acts_as_followable
end
