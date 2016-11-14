class Broker < ApplicationRecord
  include Searchable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_followable

end
