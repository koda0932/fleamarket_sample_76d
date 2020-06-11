class PostsController < ApplicationController
  before_action :set_post, except: [:index, :new, :create]
  before_action :set_parents, only: [:new, :create]

  def index
    @posts = Post.includes(:post_images).last(3).reverse
  end

  def new
    @post = Post.new
    @post.post_images.new
  end

  def create
    @post = Post.new(post_params)
    if @post.post_images.present?
      if @post.save
        redirect_to root_path
      else
        render action: :new
      end
    else
      render partial:"form" ,locals: {post:new}
    end
  end

  def edit
    
  end

  def update
    if @post.update(post_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def post_params
    params.require(:post).permit(:name, :introduce, :category_id, :delivery_fee, :user_address, :shipping, :price, :status, :delivery_status, post_images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def set_parents
    @parents = Category.all.order("id asc").limit(13)
  end

end
