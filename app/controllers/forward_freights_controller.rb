class ForwardFreightsController < ApplicationController
  before_action :authenticate_any!

  def show
    @user = ForwardFreight.find(params[:id]).decorate
  end

  def search
    @forward_freights = ForwardFreight.filter(params[:search].slice(:city, :having_tags))
  end
end
