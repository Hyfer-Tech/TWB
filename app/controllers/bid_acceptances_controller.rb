class BidAcceptancesController < ApplicationController

  def create
    @bid = Bid.find(params[:bid_id])
    @bid.toggle_accept(@bid.accepted)
    redirect_back(fallback_location: root_path)
  end

end
