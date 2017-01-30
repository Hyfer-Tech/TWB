class BusinessUserChatRoomsController < ApplicationController
  before_action :authenticate_any!

  def create
    @business_user = BusinessUser.find(params[:business_user_id])
    @chat_room = ChatRoom.new(user_id: current_user.id, user_type: current_user.class.name, member_id: @business_user.id, member_type: @business_user.class.name)

    if @chat_room.save
      redirect_to chat_room_path(@chat_room)
    else
      flash[:alert] = @chat_room.errors.full_messages[0]
    end
  end
end
