class BidAcceptancesController < ApplicationController
	before_action :authenticate_business_user!

  def create
    @bid = Bid.find(params[:bid_id])
    @bid.toggle_accept(@bid.accepted)
    
    @bid.accepted ? @bid.job.update(agent_id: @bid.bidder.id) : @bid.job.update(agent_id: nil)

    redirect_back(fallback_location: root_path)
  end  

end
