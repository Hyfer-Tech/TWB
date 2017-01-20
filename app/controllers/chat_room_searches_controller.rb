class ChatRoomSearchesController < ApplicationController
  before_action :authenticate_any!
  
  def index
    if params[:message_search]
      @chat_rooms = current_user.chat_rooms.find_with_name(params[:message_search][:name].downcase)
    else
      @chat_rooms = current_user.chat_rooms
    end    
  end
end
