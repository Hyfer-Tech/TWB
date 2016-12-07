class ForwardFreight < ApplicationRecord
  # include Searchable
  acts_as_taggable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  mount_uploader :avatar, AvatarUploader

  validates :email, :first_name, :last_name, :phone, :address_line_1, :city, :state_province_county, :country, presence: true

  acts_as_followable
  acts_as_follower

  has_many :jobs, as: :agent

  has_many :bids, as: :bidder


  has_many :uploads, as: :user
end

