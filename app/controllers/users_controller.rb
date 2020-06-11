class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:mypage]
  before_action :set_user, only: [:show]

  def mypage
    redirect_to user_path(current_user)
  end

  def show
  end

  def destroy
  end

  private

  def set_user
    # @user = User.find([:id])
  end

end
