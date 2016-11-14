class Broker < ApplicationRecord
  include Searchable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
