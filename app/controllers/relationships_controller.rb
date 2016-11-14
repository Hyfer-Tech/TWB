class RelationshipsController < ApplicationController
  before_action :authenticate_any!

  def create    
    user = find_user
    current_business_user.follow(user)
  end

  def destroy
    user = find_user
    current_business_user.stop_following(user)
  end

  private

  def find_user
    relationship_params[:user_type].constantize.find(relationship_params[:user_id])
  end

  def relationship_params
    params.require(:relationship).permit(:user_type, :user_id)
  end
end
