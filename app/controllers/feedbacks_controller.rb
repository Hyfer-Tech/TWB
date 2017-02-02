class FeedbacksController < ApplicationController
  before_action :authenticate_broker_or_forward_freight, only: [:new, :create]

  def show
    @feedback = Feedback.find(params[:id]).decorate
  end

  def new
    @audit = Audit.find(params[:audit_id])
    @feedback = @audit.feedbacks.new
  end

  def create
    @feedback = current_user.feedbacks.new(feedback_params)
    if @feedback.save
      flash[:success] = "Thank you. Your feedback has been successfully submitted."
      redirect_to audit_feedback_path(params[:audit_id], @feedback)
    else
      flash[:alert] = @feedback.errors.full_messages[0]
      render :new
    end
  end

  private
  def feedback_params
      params.require(:feedback).permit(:body).merge(audit_id: params[:audit_id])
  end
end
