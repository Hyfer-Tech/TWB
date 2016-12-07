class UserJobsController < ApplicationController
	before_action :authenticate_any!

	def index
		@user_jobs = current_user.jobs.all.includes(:shipment, :client, shipment: :products, shipment: :shipment_products)
	end	
end
