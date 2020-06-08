class PostsController < ApplicationController

  def index
    
  end

  def new
    @post = Post.new
    @post.post_images.new
  end

  def create
    @post = Post.create(post_params)
    @post.save
    redirect_to new_post_path
  end

  private
  def post_params
    params.require(:post).permit(:name, :introduce, :category, :delivery_fee, :user_address, :shipping, :price, :status, :delivery_status, post_images_attributes: [:image]).merge(user_id: current_user.id)
  end
end
