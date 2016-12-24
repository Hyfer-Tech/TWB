class RatingsController < ApplicationController
	before_filter :check_user
	def create
		@rating = @user.ratings.new(rating_params)

		if @rating.save
			redirect_to profile_users_path(@user), flash[:success] = "Your rating has been saved!"
		else
			redirect_to profile_users_path(@user), flash[:alert] = "Something went wrong!"
	end

	def update
		@rating = Rating.find(params[:id])
		@rating.update_attribute(rating_params)
	end

	private
	def check_user
		@user = User.find(params[:user_id])
	end

	def rating_params
		params.require(:value)
	end

end
