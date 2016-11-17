class UsersController < ApplicationController
	before_action :authenticate_any!

  def show
    @user = current_user.decorate
  end

	def profile
    @user = current_user.decorate
    render layout: 'profile'
	end

  def saved  
    @user = current_user.decorate  
    @following = UserDecorator.decorate_collection(@user.all_following)
    render layout: 'profile'
  end

end
