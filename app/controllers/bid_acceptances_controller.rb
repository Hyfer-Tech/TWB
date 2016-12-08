class BidAcceptancesController < ApplicationController

  def create
    @bid = Bid.find(params[:bid_id])
    @bid.toggle_accept(@bid.accepted)
    redirect_to :back
  end

end
