class BidsController < ApplicationController
  def new
    @bid = Bid.new    
  end

  def create
    @job = Job.find(params[:job_id])
    @bid = @job.bids.new(bids_params)
    if @bid.save
      redirect_to root_path
    else
      render :new, status: :inprocessable_entity
    end
  end

  private 

  def bids_params
    params.require(:bid).permit(:cover_letter,:attachment, :price).merge(bidder_id: current_user.id, bidder_type: current_user.class.name)
  end
end
