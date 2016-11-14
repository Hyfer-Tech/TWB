class UsersController < ApplicationController
	before_action :authenticate_any!
	include UsersHelper
	def profile
		@user = assign_user
	end

end
