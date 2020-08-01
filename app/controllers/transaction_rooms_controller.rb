class TransactionRoomsController < ApplicationController
  def show
    # roomIDを取得
    @room = TransactionRoom.find(params[:id])
    # 購入者がcurrent_user、かつroomがparamsと同じ取引(transaction)が存在したら許可
    if Transaction.find_by(buyer_id: current_user.id, transaction_room_id: @room.id).present?
      @transaction = Transaction.find_by(transaction_room_id: @room.id)
      @post = Post.find_by(id: @transaction.post_id)
      # roomのメッセージを全て取得
      @messages = @room.transaction_messages.includes(:user).order("created_at asc")
      @message = TransactionMessage.new
    else
      flash[:alert] = "取引ページへアクセス権限がありません。"
      redirect_back(fallback_location: root_path)
    end
  end
end
