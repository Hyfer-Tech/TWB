class BidsController < ApplicationController
  before_action :authenticate_any!
  before_action :ensure_business_user! ,except: :index
  before_action :ensure_my_job!, only: :index
  before_action :ensure_one_bid_by_one_user_for_one_job!, only: :new
  before_action :is_owner_of_bid?, only: :destroy
  before_action :ensure_less_then_ten_bids?, only: :new
  before_action :ensure_less_then_fifteen_bids?, only: :new

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

  def destroy
    @bid = Bid.find(params[:id])
    @bid.destroy
    flash[:success] = "Bid has been sucessfully deleted"
    redirect_to job_bids_path(job_id: params[:job_id])
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

  def ensure_one_bid_by_one_user_for_one_job!
    return if Bid.where(job_id: params[:job_id], bidder_id: current_user.id, bidder_type: current_user.class.name).empty?
    flash[:alert] = "Sorry! You already have bidded for this Job"
    redirect_to root_path
  end

  def is_owner_of_bid?
    @bid = Bid.find(params[:id])
    unless (@bid.bidder_id.eql? current_user.id) && (@bid.bidder_type.eql? current_user.class.name)
      flash[:alert] = "Sorry! You are not the owner of this Bid"
      redirect_to root_path
    end
  end

  def ensure_less_then_ten_bids?
    @bids = Bid.where(bidder_id: current_user.id, bidder_type: current_user.class.name)
    @bids_this_month = @bids.this_month.count
    if @bids_this_month >= 10 && current_user.account_type == 0 && broker_signed_in?
      flash[:alert] = "Sorry! You can't bid on more then 10 jobs please switch to premium plan."
      redirect_to root_path
    end
  end

  def ensure_less_then_fifteen_bids?
    @bids = Bid.where(bidder_id: current_user.id, bidder_type: current_user.class.name)
    @bids_this_month = @bids.this_month.count
    if @bids_this_month >= 1 && current_user.account_type == 0 && forward_freight_signed_in?
      flash[:alert] = "Sorry! You can't bid on more then 15 jobs please switch to premium plan."
      redirect_to root_path
    end
  end
end
