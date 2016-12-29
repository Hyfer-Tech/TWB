class BrokersController < ApplicationController
  before_action :authenticate_broker!

  def show
    @user = Broker.find(params[:id]).decorate
  end

  def past_clients
  	@bids = Broker.successful_bids(current_user)
  end
end
