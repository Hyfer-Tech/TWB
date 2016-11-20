class ForwardFreightsController < ApplicationController
  def show
    @user = ForwardFreight.find(params[:id]).decorate
  end
end
