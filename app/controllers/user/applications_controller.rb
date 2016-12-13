class User::ApplicationsController < ApplicationController
	before_action (:authenticate_broker! || :authenticate_forward_freight!)

	def index
		if current_user.bids.exists?
			@applied_bids = current_user.bids.all.includes(:jobs, :bidder,job: :shipment, shipment: :products, shipment: :shipment_products)
		end
	end
end
	