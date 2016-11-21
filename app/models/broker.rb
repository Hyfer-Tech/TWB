class Broker < ApplicationRecord
  include Searchable
  acts_as_taggable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :phone, :firm_name,:address_line_1, :city, :zip_postal_code,:state_province_county, :country, :broker_number, presence: true

  mount_uploader :avatar, AvatarUploader

  acts_as_followable
  acts_as_follower
end
