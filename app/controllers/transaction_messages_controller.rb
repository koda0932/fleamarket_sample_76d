class TransactionMessagesController < ApplicationController
  before_action :set_room

  def create
    @message = TransactionMessage.create(message_params)
    redirect_to @room
  end

  private

  def set_room
    @room = TransactionRoom.find(params[:transaction_message][:transaction_room_id])
  end

  def message_params
    params.require(:transaction_message).permit(:user_id, :content, :transaction_room_id).merge(user_id: current_user.id)
  end
end
