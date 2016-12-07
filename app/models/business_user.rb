class BusinessUser < ApplicationRecord  
  # include Searchable
  acts_as_taggable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :products
  has_many :shipments

  mount_uploader :avatar, AvatarUploader

  validates :email, :first_name, :last_name, :phone, :address_line_1, :city, :state_province_county, :country, presence: true

  enum account_type: [:free_account, :premium_account]

  acts_as_follower
  acts_as_followable

  has_many :jobs, as: :client
end
