class TransactionMessagesController < ApplicationController
  # before_action :set_room
  # before_action :set_message

  def create
    @message = TransactionMessage.create(message_params)
    redirect_to @message
  end

  private

  # def set_room
  #   @room = TransactionRoom.find(params[:Transaction_message][:room_id])
  # end

  # def set_message
  #   @message = TransactionMessage.find(params[:id])
  # end

  # def gets_entries_all_messages
  #   @messages = @room.messages.includes(:user).order("created_at asc")
  #   @entries = @room.entries
  # end

  def message_params
    params.require(:transaction_message).permit(:user_id, :content, :transaction_room_id).merge(user_id: current_user.id)
  end
end
