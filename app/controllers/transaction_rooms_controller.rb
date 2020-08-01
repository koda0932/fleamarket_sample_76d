class TransactionRoomsController < ApplicationController
  def show
    @room = TransactionRoom.find(params[:id])
    if Transaction.where(transaction_room_id: @room).present?
      # @messages = @room.messages.includes(:user).order("created_at asc")
      # @message = Message.new
      # @entries = @room.entries.includes(:user)
    else
      flash[:alert] = "不正な操作です"
      redirect_back(fallback_location: root_path)
    end
  end
end
