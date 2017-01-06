class ConversationsController < ApplicationController
  before_action :authenticate_any!
  before_action :get_mailbox
  before_action :get_conversation, except: [:index]


  def index
    @conversations = @mailbox.inbox.paginate(page: params[:page], per_page: 10)
  end

  def show
    @conversations = @mailbox.inbox
  end

  def reply
    @reply = current_user.reply_to_conversation(@conversation, params[:body])
    MessageRelayJob.perform_later(@reply)
    # flash[:success] = 'Reply sent'
    #
    # respond_to do |format|
    #   format.js
    # end
  end

  private

  def get_mailbox
    @mailbox ||= current_user.mailbox
  end

  def get_conversation
    @conversation ||= @mailbox.conversations.find(params[:id])
  end
end
