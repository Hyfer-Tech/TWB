class MessageRelayJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "conversations: #{message.conversation.id}", {}
      message: ConversationsController.render(message),
      conversation_id: message.conversation.id
    }
  end
end
