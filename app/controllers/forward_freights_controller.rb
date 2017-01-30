class ForwardFreightsController < ApplicationController
  before_action :authenticate_any!

  def show
    @user = ForwardFreight.find(params[:id]).decorate
  end

  def search 
    if params[:search]
      @forward_freights = ForwardFreight.filter(params[:search].slice(:city, :with_tags)).decorate
    else
      @forward_freights = ForwardFreight.all.decorate
    end
  end
end
