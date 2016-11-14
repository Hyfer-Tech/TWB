class UsersController < ApplicationController
	before_action :authenticate_any!
	include ApplicationHelper

	def profile
    @user = current_user.decorate
	end

end
