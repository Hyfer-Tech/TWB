class Broker < ApplicationRecord
  include Searchable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :address_line_1, :country, :broker_number, presence: true

  mount_uploader :avatar, AvatarUploader

end
