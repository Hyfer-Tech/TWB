class Jobs::SearchesController < ApplicationController
	helper_method :sort_column, :sort_direction

	def index
		@jobs = Job.search(params[:search])

		@jobs = @jobs.order(sort_column + " " + sort_direction) if @jobs.present?

		unless @jobs.present?
		 	flash[:alert] = "No such jobs exist!"
		 	redirect_to root_path
	  end
	end

	private
	def sort_column
		Job.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
	end

	def sort_direction
		%w[ASC DESC].include?(params[:direction]) ? params[:direction] : "DESC"
	end
end
