class ShipmentsController < ApplicationController
	before_action :authenticate_business_user!

	def index
		@shipments = current_business_user.shipments.includes(:products).order("created_at DESC")
	end

	def show
		@shipment = Shipment.find(params[:id])
	end

	def new
		@shipment = Shipment.new
		@shipment.shipment_products.build
	end

	def create
		@shipment = current_business_user.shipments.new(shipment_params)

		if @shipment.save
			flash[:success] = "A shipment has been created."
			redirect_to root_path
		else
			flash[:alert] = "An error has occured. Please try again."
			render :new, status: :inprocessable_entity
		end
	end

	private

	def shipment_params
		params.require(:shipment).permit(:title, :business_user_id, :approval, :shipment_confirmed, :save_for_later_use, shipment_products_attributes: [:id, :shipment_id, :quantity, :product_id, :_destroy], :tag_list =>[])
	end
end
