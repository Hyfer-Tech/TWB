class SearchesController < ApplicationController
	def index
		@jobs = Job.search(params[:search])
	end
end
