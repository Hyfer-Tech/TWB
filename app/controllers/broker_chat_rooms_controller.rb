class BrokerChatRoomsController < ApplicationController
  before_action :authenticate_any!

  def create
    @broker = Broker.find(params[:broker_id])
    @chat_room = ChatRoom.new(user_id: current_user.id, user_type: current_user.class.name, member_id: @broker.id, member_type: @broker.class.name)

    if @chat_room.save
      redirect_to chat_room_path(@chat_room)
    else
      flash[:alert] = @chat_room.errors.full_messages[0]
    end
  end
end
