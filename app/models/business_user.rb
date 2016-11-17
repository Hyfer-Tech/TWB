class BusinessUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :products
  has_many :shipments

  mount_uploader :avatar, AvatarUploader

  enum account_type: [:free_account, :premium_account]

end
