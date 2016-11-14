class BusinessUsersController < ApplicationController
  def profile
  end

  def index 
    if params[:query].present?      
      @brokers = Broker.search(params[:query])
      @forward_freights = ForwardFreight.search(params[:query])
    else
      @brokers = Broker.all
    end
  end
end
