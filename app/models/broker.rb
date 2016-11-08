class Broker < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.search(param)
    where("first_name LIKE ? OR last_name LIKE ? OR email LIKE ?", 
          "%#{param}%", "%#{param}%", "%#{param}%") 
  end
end
