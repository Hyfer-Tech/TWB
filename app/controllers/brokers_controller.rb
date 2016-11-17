class BrokersController < ApplicationController
  def show
    @user = Broker.find(params[:id]).decorate
  end
end
