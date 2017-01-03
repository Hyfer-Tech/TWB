class JobsController < ApplicationController
	before_action :ensure_business_user! ,except: [:index, :show]
	before_action :ensure_broker!, only: [:show]

	def index
		if params[:tag]
			@jobs = Job.tagged_with(params[:tag]).includes(:shipment, :client, shipment: :products, shipment: :shipment_products)
	  else
			@jobs = Job.all.includes(:shipment, :client, shipment: :products, shipment: :shipment_products)
	  end
		@user_suggestions = current_user.suggested_users
	end

	def new
		@job = Job.new
		@shipment = Shipment.find(params[:shipment_id])
	end

	def create
		@job = Job.new(jobs_params)
		if @job.save
			flash[:success] = "Your job has been posted!"
			redirect_to jobs_path
		else
			render :new, status: :inprocessable_entity
		end
	end

	def show
		@job = Job.find(params[:id])
	end

	private

	def jobs_params
		params.require(:job).permit(:job_title, :job_type, :shipment_id, :date_of_shipment, :location_of_shipment, :place_being_shipped_to, :border_expected_to_cross, :price, :tag_list => []).merge(client_id: current_user.id, client_type: current_user.class.name, shipment_id: params[:shipment_id])
	end

	def ensure_business_user!
		return if business_user_signed_in?
		flash[:alert] = "You must be a business account type to create a job."
		redirect_to root_path
	end

	def ensure_broker!
		return if broker_signed_in? || current_user.class.name == "BusinessUser"
		flash[:alert] = "You must be a broker to view the jobs."
		redirect_to root_path
	end
end
