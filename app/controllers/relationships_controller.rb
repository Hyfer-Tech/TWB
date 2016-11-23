class RelationshipsController < ApplicationController
  before_action :authenticate_any!

  def create    
    current_user.follow(find_user)     
  end

  def destroy
    current_user.stop_following(find_user)
  end

  private

  def find_user
    @user ||= relationship_params[:user_type].constantize.find(relationship_params[:user_id].to_i)
  end

  def relationship_params    
    params.permit(:user_type, :user_id)
  end
end
