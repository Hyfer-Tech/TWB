class AuditRequests::ApprovalsController < ApplicationController
  before_action :authenticate_business_user!

  def create
      @audit_request = AuditRequest.find(params[:audit_request_id])

      @audit_request.approve!
  end
end
