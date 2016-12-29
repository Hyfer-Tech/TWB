class User::ApplicationsController < ApplicationController
	before_action :ensure_either_broker_or_ff

	def index
		@applied_bids = current_user.bids.all.includes(:job, :bidder,job: :shipment, shipment: :products, shipment: :shipment_products)
	end

	private
	def ensure_either_broker_or_ff
		return if (broker_signed_in? || forward_freight_signed_in?)
		flash[:alert] = "You are not authorized to view this page."
		redirect_to root_path
	end
end
