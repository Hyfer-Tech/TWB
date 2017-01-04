class MessagesController < ApplicationController
  before_action :authenticate_any!

  def new
  end

  def create
    recipients = BusinessUser.where(id: params['recipients']) || Broker.where(id: params['recipients']) || ForwardFreight.where(id: params['recipients'])
    conversation = current_user.send_message(recipients, params[:message][:body], params[:message][:subject]).conversation
    flash[:success] = "Message has been sent!"
    redirect_to conversation_path(conversation)
  end
end
