class JobsController < ApplicationController
	before_action :ensure_business_user! ,except: :index
	before_action :ensure_broker!, only: [:show]

	def index
		@jobs = Job.all.includes(:shipment, :client, shipment: :products, shipment: :shipment_products)
	end

	def new
		@job = Job.new
	end

	def create
		@job = Job.new(jobs_params)
		if @job.save
			redirect_to root_path
		else
			render :new, status: :inprocessable_entity
		end
	end

	def show
		@job = Job.find(params[:id])
	end

	private
	def jobs_params
		params.require(:job).permit(:job_type, :shipment_id).merge(client_id: current_user.id, client_type: current_user.class.name)
	end

	def ensure_business_user!
		return if business_user_signed_in?
		flash[:alert] = "You must be a business account type to create a job."
		redirect_to root_path
	end

	def ensure_broker!
		return if broker_signed_in?
		flash[:alert] = "You must be a broker to view the jobs."
		redirect_to root_path
	end
end
