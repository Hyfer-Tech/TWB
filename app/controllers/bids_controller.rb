class BidsController < ApplicationController
  before_action :authenticate_any!
  before_action :ensure_business_user! ,except: :index
  before_action :ensure_my_job!, only: :index

  def index
    @bids = Bid.where(job_id: params[:job_id]).order("created_at DESC")
  end

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
    params.require(:bid).permit(:cover_letter, :price).merge(bidder_id: current_user.id, bidder_type: current_user.class.name)
  end

  def ensure_business_user!
    return unless business_user_signed_in?
    flash[:alert] = "Your Account type is business user you can't bid to jobs"
    redirect_to root_path
  end

  def ensure_my_job!
    return if current_user.id.equal? Job.find(params[:job_id]).client_id
    flash[:alert] = "Sorry! this job is not related to you"
    redirect_to root_path
  end
end
