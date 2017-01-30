class RatingsController < ApplicationController
	before_action :authenticate_any!
<<<<<<< HEAD
=======
	before_action :ensure_different_user_type!
>>>>>>> 22fcf3140e38dded05c01f30f342ca2ae903f568

	def create
		@rating = @user.ratings.new(rating_params)

		if @rating.save
			redirect_to profile_users_path(@user), flash[:success] = "Your rating has been saved!"
		else
			redirect_to profile_users_path(@user), flash[:alert] = "Something went wrong!"
<<<<<<< HEAD
		end

		@user = User.find(params[:user_id])
		return if current_user.class.name != @user.class.name
		flash[:alert] = "You can't rate a #{current_user.class.name}!"
		redirect_to profile_users_path(@user)
=======
		end		
>>>>>>> 22fcf3140e38dded05c01f30f342ca2ae903f568
	end

	def update
		@rating = Rating.find(params[:id])
		@rating.update_attribute(rating_params)
	end

	private

<<<<<<< HEAD
=======
	def ensure_different_user_type!
		@user = User.find(params[:user_id])
		return if current_user.class.name != @user.class.name
		flash[:alert] = "You can't rate a #{current_user.class.name}!"
		redirect_to profile_users_path(@user)
	end

>>>>>>> 22fcf3140e38dded05c01f30f342ca2ae903f568
	def rating_params
		params.require(:value)
	end

end