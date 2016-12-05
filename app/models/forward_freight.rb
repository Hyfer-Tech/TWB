class ForwardFreight < ApplicationRecord
  include Searchable
  acts_as_taggable
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  mount_uploader :avatar, AvatarUploader

  CANADIAN_POSTAL_CODE = /\A[ABCEGHJKLMNPRSTVXY]{1}\\d{1}[A-Z]{1}[ -]?\\d{1}[A-Z]{1}\\d{1}\z/


  validates :email, :first_name, :last_name, :phone, :address_line_1, :city, :zip_postal_code, :state_province_county, :country, presence: true
  validates :zip_postal_code, format: { with: CANADIAN_POSTAL_CODE }


  acts_as_followable
  acts_as_follower

  has_many :jobs, as: :agent
end