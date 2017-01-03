class UsersController < ApplicationController
	before_action :authenticate_any!
  
	def profile
    @user = current_user.decorate
	end  

  def saved  
    @user = current_user.decorate  
    @following = UserDecorator.decorate_collection(@user.all_following)    
  end

end
