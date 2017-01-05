class Rating < ApplicationRecord
	belongs_to :broker
	belongs_to :business_user 
	belongs_to :forward_freight
	validates_inclusion_of :value, in: :1..5
end