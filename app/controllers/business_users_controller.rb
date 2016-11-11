class BusinessUsersController < ApplicationController
  def profile
  end

  def index 
    @brokers = Broker.search_for(params[:q])
  end
end
