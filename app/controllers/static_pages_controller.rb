class StaticPagesController < ApplicationController
  include ApplicationHelper

  def index
    if current_user.present?
      redirect_to dashboard_path
    else
      render layout: 'landing_page'
    end
  end

end
