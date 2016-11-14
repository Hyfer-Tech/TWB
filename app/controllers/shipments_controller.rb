class ShipmentsController < ApplicationController
	before_action :authenticate_business_user!

	def new
		@shipment = Shipment.new
		# @shipment.build_business_user
	end

	def create
		@shipment = current_business_user.shipments.create!(shipment_params)
		if @shipment.valid?
			redirect_to root_path
		else
			render :new, status: :inprocessable_entity
		end
	end

	private
	def shipment_params
		params.require(:shipment).permit(:quantity, :broker_id, :forward_freight_id,:approval, :shipment_confirmed)
	end
end