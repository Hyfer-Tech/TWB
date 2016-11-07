class UsersController < ApplicationController
	before_action :authenticate_business_user!

	def profile
	end
end
