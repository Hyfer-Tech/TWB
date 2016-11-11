class Broker < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  has_many :tags, as: :taggable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.search_for(params)
    if params.present?
      search(params)
    end
  end
end
