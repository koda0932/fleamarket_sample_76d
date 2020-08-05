class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage]
  def mypage
    @posts = Transaction.where(buyer_id: current_user)
    # binding.pry
  end

  def logout
  end

  private

end
