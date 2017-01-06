class ForwardFreightsController < ApplicationController
  before_action :authenticate_any!
  
  def show
    @user = ForwardFreight.find(params[:id]).decorate
  end
end
