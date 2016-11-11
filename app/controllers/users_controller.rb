class UsersController < ApplicationController
	before_action :authenticate_any!

	def profile
		@user = DeviseDecorator.assign_user
	end

end
