class BusinessUsersController < ApplicationController
  before_action :authenticate_any!
  
  def show
    @user = BusinessUser.find(params[:id]).decorate
  end
end
