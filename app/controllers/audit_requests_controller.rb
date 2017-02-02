class AuditRequestsController < ApplicationController
  before_action :authenticate_broker_or_forward_freight, only: [:create]
  before_action :authenticate_business_user!, only: :index
  before_action :ensure_owner!, only: :index

  def index
    @audit_requests = @audit.audit_requests.order(created_at: :desc).decorate
  end

  def create
    @audit = find_audit
    @audit_request = current_user.audit_requests.new(audit: @audit)
    if @audit_request.save
      flash[:success] = "Your request has been submitted."
    else
      flash[:alert] = @audit_request.errors.full_messages[0]
    end
    redirect_to audits_path(@audit)
  end

  private

  def find_audit
    @audit ||= Audit.find(params[:audit_id])
  end

  def ensure_owner!
    @audit = find_audit
    return if @audit.business_user == current_user
    flash[:alert] = "Unauthorized"
    redirect_to audits_path
  end
end
