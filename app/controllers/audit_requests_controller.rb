class AuditRequestsController < ApplicationController
  before_action :authenticate_broker_or_forward_freight

  def create
    @audit = Audit.find(params[:audit_id])
    @audit_request = @audit.audit_requests.new(agent_id: current_user.id)
    if @audit_request.save
      flash[:success] = "Your request has been submitted."
    else
      flash[:alert] = @audit_request.errors.full_messages[0]
    end
    redirect_to audit_path(@audit)
  end
end
