class BusinessUser < ApplicationRecord
  include Searchable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :products
  has_many :shipments

  mount_uploader :avatar, AvatarUploader

  acts_as_follower
end
