class DashboardController < ApplicationController
  before_action :authenticate_any!
  layout 'dashboard'

  def index
    
  end

  def search
    if params[:query].present?      
      @brokers = UserDecorator.decorate_collection(Broker.search(params[:query]))
      @forward_freights = ForwardFreight.search(params[:query])
    else
      @brokers = Broker.all.decorate
    end    
  end

  def favorites
    @user = current_user.decorate  
    @following = UserDecorator.decorate_collection(@user.all_following)
  end
end
