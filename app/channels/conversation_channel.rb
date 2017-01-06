# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ConversationChannel < ApplicationCable::Channel
  def subscribed
    current_user.mailbox.inbox.each do |conversation|
      stream_from "conversation:#{conversation.id}"
    end
  end

  def unsubscribed
    stop_all_streams
  end
end
