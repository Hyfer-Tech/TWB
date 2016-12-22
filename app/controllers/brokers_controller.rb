class BrokersController < ApplicationController
  before_action :authenticate_broker!

  def show
    @user = Broker.find(params[:id]).decorate
  end

  def past_clients
  	@bids = PastClient.new(current_user).successful_bids
  end
end
