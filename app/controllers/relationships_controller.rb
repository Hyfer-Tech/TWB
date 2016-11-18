class RelationshipsController < ApplicationController
  before_action :authenticate_any!

  def create    
    if find_user      
      current_user.follow(find_user)      
    else
      # error handling here
    end
  end

  def destroy
    if find_user
      current_user.stop_following(find_user)      
    else
      # error handling here
    end
  end

  private

  def find_user
    @user ||= relationship_params[:user_type].constantize.find(relationship_params[:user_id].to_i)
  end

  def relationship_params    
    params.permit(:user_type, :user_id)
  end
end
