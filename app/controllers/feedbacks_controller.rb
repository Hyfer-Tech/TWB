class FeedbacksController < ApplicationController
  before_action :authenticate_broker_or_forward_freight

  def new
    @audit = Audit.find(params[:audit_id])
    @feedback = @audit.feebacks.new(feedback_params)
  end

  def create
    @audit = Audit.find(params[:audit_id])
    @feedback = @audit.feebacks.new(feedback_params)
    if @feedback.save
      flash[:success] = "Thank you. Your feedback has been successfully submitted."
      redirect_to root_path
    else
      flash[:alert] = @feedback.errors.full_messages[0]
      render :new
    end
  end

  private
  def feedback_params
      params.require(:feedback).permit().merge(agent_id: current_user.id)
  end
end
