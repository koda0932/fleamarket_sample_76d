class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage]
  def mypage
    @posts = Transaction.where(buyer_id: current_user, acceptance: 0)
    @posts_acceptance = Transaction.where(buyer_id: current_user, acceptance: 1)
    @posts_count = Post.where(user_id: current_user.id).count
    @good_review_count = Transaction.where(review: 1).count
    @bad_review_count = Transaction.where(review: 2).count
  end

  def logout
  end

  private

end
