class BrokersController < ApplicationController
  before_action :authenticate_broker!, only: [:show, :past_clients]

  def show
    @user = Broker.find(params[:id]).decorate
  end

  def past_clients
  	@bids = Broker.successful_bids(current_user)
  end

  def search
    @brokers = Broker.filter(params[:search].slice(:city, :having_tags))
      # @brokers = Broker.all.city(params[:search])
    binding.pry
  end
end
