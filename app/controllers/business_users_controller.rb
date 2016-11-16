class BusinessUsersController < ApplicationController
  def index 
    if params[:query].present?      
      @brokers = UserDecorator.decorate_collection(Broker.search(params[:query]))
      @forward_freights = ForwardFreight.search(params[:query])
    else
      @brokers = Broker.all.decorate
    end
  end
end
