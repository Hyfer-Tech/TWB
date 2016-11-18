class BusinessUsersController < ApplicationController
  def show
    @user = BusinessUser.find(params[:id]).decorate
  end
end
