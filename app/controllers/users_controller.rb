class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage]
  def mypage
    @posts = Transaction.where(buyer_id: current_user, acceptance: 0)
    @posts_acceptance = Transaction.where(buyer_id: current_user, acceptance: 1)
  end

  def logout
  end

  private

end
