class BusinessUsersController < ApplicationController
  def profile
  end

  def index 
    @brokers = Broker.search((params[:q].present? ? params[:q] : '*')).records
  end
end
