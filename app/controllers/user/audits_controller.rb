class User::AuditsController < ApplicationController
  before_action :authenticate_any!

  def index
    @audits = current_user.audits.order("created_at DESC")
  end
end
