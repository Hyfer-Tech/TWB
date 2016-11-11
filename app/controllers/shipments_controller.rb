class ShipmentsController < ApplicationController
	def new
		@shipment = Shipment.new
	end

	def create
		@shipment = Shipment.create(shipment_params)
		
	end

	private
	def shipment_params
		params.require(:shipment).permit(:quantity, :broker_id, :forward_freight_id,:approval, :shipment_confirmed)
	end
end
