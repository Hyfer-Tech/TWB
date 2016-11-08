class BusinessUsersController < ApplicationController
  def profile
  end

  def index 
    @brokers = Broker.all
    if params[:query]
      @brokers = Broker.search(params[:query])
    else 
      @brokers = Broker.all
    end
  end
end
