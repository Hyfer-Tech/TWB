class BusinessUsersController < ApplicationController

  def index 
    @brokers = Broker.search_for(params[:q])
  end

end
