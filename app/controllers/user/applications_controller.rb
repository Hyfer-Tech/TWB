class User::ApplicationsController < ApplicationController
	before_action :ensure_either_broker_or_ff

	def index
<<<<<<< HEAD
		@applied_bids = current_user.bids.all.includes(:job, :bidder,job: :shipment)
=======
		if current_user.bids.exists?
			@applied_bids = current_user.bids.all
		end
>>>>>>> 6a397c6bfc5d5241beea00ecfc9d1bcc76f27afe
	end

	private
	def ensure_either_broker_or_ff
		return if (broker_signed_in? || forward_freight_signed_in?)
		flash[:alert] = "You are not authorized to view this page."
		redirect_to root_path
	end
end
