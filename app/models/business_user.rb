class BusinessUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :tags, as: :taggable
  accepts_nested_attributes_for :tags
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
