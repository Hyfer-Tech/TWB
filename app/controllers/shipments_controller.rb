class ShipmentsController < ApplicationController
	before_action :authenticate_business_user!

	def new
		@shipment = Shipment.new
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
		params.require(:shipment).permit(:quantity)
	end
end