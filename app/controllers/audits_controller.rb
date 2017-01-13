class AuditsController < ApplicationController
  before_action :authenticate_business_user!, except: :index

  def index
    @audits = Audit.all.order("created_at DESC")
  end

  def new
    @audit = current_business_user.audits.new(audit_params)
  end

  def create
    @audit = current_business_user.audits.new(audit_params)
    if @audit.save
      flash[:success] = "Audit has been created."
      redirect_to audits_path
    else
      flash[:alert] = @audit.errors.full_messages[0]
      render :new
    end
  end

  private
  def audit_params
    params.require(:audit).permit(:nafta_certificate, :canada_customs)
  end
end
