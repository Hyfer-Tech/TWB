class UsersController < ApplicationController
	before_action :authenticate_any!

  def show
    @user = current_user.decorate
  end

	def profile
    @user = current_user.decorate
	end

end
