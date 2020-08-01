class TransactionRoomsController < ApplicationController
  def show
    @transaction_room = TransactionRoom.find(params[:id])
    # if TransactionRoom.where(user_id: current_user.id, room_id: @transaction_room.id).present?
      # @messages = @room.messages.includes(:user).order("created_at asc")
      # @message = Message.new
      # @entries = @room.entries.includes(:user)
    # else
      # flash[:alert] = "不正な操作です"
      # redirect_back(fallback_location: root_path)
    # end
  end
end
