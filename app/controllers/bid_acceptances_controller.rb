class BidAcceptancesController < ApplicationController
	before_action :authenticate_business_user!

  def create
    @bid = Bid.find(params[:bid_id])
    @bid.toggle_accept!(@bid.accepted)

   	if @bid.accepted? do |bid|
            Notification.create(recipient: @bid.bidder, actor: @job.client, action: "has accepted your bid", notifiable: @bid)
    	end
    end

    redirect_back(fallback_location: root_path)
  end  

end
