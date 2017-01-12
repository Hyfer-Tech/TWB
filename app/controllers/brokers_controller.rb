class BrokersController < ApplicationController
  before_action :authenticate_broker!, only: [:past_clients]

  def show
    @user = Broker.find(params[:id]).decorate
  end

  def past_clients
  	@bids = Broker.successful_bids(current_user)
  end

  def search
    if params[:search]
      @brokers = Broker.filter(params[:search].slice(:city, :having_tags)).decorate
    else
      @brokers = Broker.all.decorate
    end
  end
end
