class BusinessUsersController < ApplicationController
  def profile
  end

  def index 
    @brokers = Broker.all
  end
end
