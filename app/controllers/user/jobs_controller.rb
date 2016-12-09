class User::JobsController < ApplicationController
	before_action :authenticate_any!, only: :index

	def index
		if current_user.jobs.exists?
		    @user_jobs = current_user.jobs.all.includes(:shipment, :client, shipment: :products, shipment: :shipment_products)
		end
	end    
end
