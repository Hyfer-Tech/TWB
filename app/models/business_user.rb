class BusinessUser < ApplicationRecord
  include Searchable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :products
  has_many :shipments

  mount_uploader :avatar, AvatarUploader

  enum account_type: [:free_account, :premium_account]

  acts_as_follower
  acts_as_followable

  has_one :shipment_limit
end
