class Jobs::SearchesController < ApplicationController

	def index
		@jobs = Job.search(params[:search])

		unless @jobs.present?
		 	flash[:alert] = "No such jobs exist!"
		 	redirect_to root_path
	  	end
	end
end
