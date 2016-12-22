class Rating < ApplicationRecord
	belongs_to :broker
	belongs_to :business_user 
	belongs_to :forward_freight
end