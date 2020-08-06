class TransactionsController < ApplicationController
  def acceptance
    @room = TransactionRoom.find(params[:id])
    @transaction =  Transaction.find_by(transaction_room_id: @room.id)
    @transaction.update(acceptance: true)
    redirect_to @room
  end
end
