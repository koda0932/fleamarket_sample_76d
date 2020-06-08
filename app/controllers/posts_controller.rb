class PostsController < ApplicationController

  def index
    
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:name, :introduce, :category, :delivery_fee, :user_address, :shipping, :price, :status, :delivery_status).merge(user_id: current_user.id)
  end
end
