class TransactionRoomsController < ApplicationController
  def show
    @room = TransactionRoom.find(params[:id])
    if Transaction.find_by(buyer_id: current_user.id, transaction_room_id: @room.id).present?
      @messages = @room.transaction_messages.includes(:user).order("created_at asc")
      @message = TransactionMessage.new
      # binding.pry
      # @entries = @room.entries.includes(:user)
    else
      flash[:alert] = "不正な操作です"
      redirect_back(fallback_location: root_path)
    end
  end
end
