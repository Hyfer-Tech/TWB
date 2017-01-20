class ForwardFreightChatRoomsController < ApplicationController
  before_action :authenticate_any!

  def create
    @forward_freight = ForwardFreight.find(params[:forward_freight_id])
    @chat_room = ChatRoom.new(user_id: current_user.id, user_type: current_user.class.name, member_id: @forward_freight.id, member_type: @forward_freight.class.name)

    if @chat_room.save
      redirect_to chat_room_path(@chat_room)
    else
      flash[:alert] = @chat_room.errors.full_messages[0]
    end
  end
end
