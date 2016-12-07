class UploadsController < ApplicationController
  before_action :authenticate_any!

  def create
    @upload = current_user.uploads.create(upload_params)

    if @upload.valid?
      flash[:success] = "File has been uploaded!"
    else
      flash[:error] = "Error occured."
    end

    redirect_to root_path
  end

  private

  def upload_params
    params.require(:upload).permit(:user_id, :file, :user_type)
  end
end
