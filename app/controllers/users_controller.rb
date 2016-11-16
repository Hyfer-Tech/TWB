class UsersController < ApplicationController
	before_action :authenticate_any!

	def profile
    @user = current_user.decorate
	end

end
