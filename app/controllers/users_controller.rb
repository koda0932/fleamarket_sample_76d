class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage]
  def mypage
    # @posts1 = Post.where(purchased: true).transaction.where(buyer_id: current_user).order('created_at desc')
    # @posts = @posts1.transaction.where(buyer_id: current_user).order('created_at desc')
    # @posts = User.transactions.where(buyer_id: current_user).order('created_at desc')
    @posts = Transaction.where(buyer_id: current_user)
    # @posts = Post.transaction.all
    # @user = User.find(current_user.id)
    # @buying_post = @user.buying_post
    # @posts = Post.where(post_id: @buying_post)
  end

  def logout
  end

  private

end
