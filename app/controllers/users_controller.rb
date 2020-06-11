class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:mypage]

  def mypage
  end

  def destroy
  end

  private

end
