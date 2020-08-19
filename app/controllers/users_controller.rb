class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage]
  def mypage
    @transaction_posts = Transaction.where(buyer_id: current_user, acceptance: 0)
    @acceptance_posts= Transaction.where(buyer_id: current_user, acceptance: 1)
    @posts_count = Post.where(user_id: current_user).count
    @good_review_count = Transaction.where(seller_id: current_user, review: 1).count
    @bad_review_count = Transaction.where(seller_id: current_user, review: 2).count
  end

  def logout
  end

  private

end
