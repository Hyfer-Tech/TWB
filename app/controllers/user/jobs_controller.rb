class User::JobsController < ApplicationController
	before_action :authenticate_any!, only: :index

	def index
    @user_jobs = current_user.jobs.all.includes(:shipment, :client, shipment: :products, shipment: :shipment_products)
	end    
end
