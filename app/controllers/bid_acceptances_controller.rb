class BidAcceptancesController < ApplicationController
	before_action :authenticate_business_user!

  def create
    @bid = Bid.find(params[:bid_id])
    @bid.toggle_accept!(@bid.accepted)
    @bid.assign_agent!
    redirect_back(fallback_location: root_path)
  end  

end
