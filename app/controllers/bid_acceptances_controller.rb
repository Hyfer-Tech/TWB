class BidAcceptancesController < ApplicationController
	before_action :authenticate_broker_or_forward_freight!

  def create
    @bid = Bid.find(params[:bid_id])
    @bid.toggle_accept(@bid.accepted)
    redirect_back(fallback_location: root_path)
  end  

end
