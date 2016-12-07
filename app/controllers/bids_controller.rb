class BidsController < ApplicationController
  before_action :ensure_business_user!

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

  def ensure_business_user!
    return unless business_user_signed_in?
    flash[:alert] = "Your Account type is business user you can't bid to jobs"
    redirect_to root_path
  end
end
