class PostsController < ApplicationController
  before_action :set_post, except: [:index, :new, :create, :search]
  before_action :set_parents, only: [:new, :create, :edit, :update]
  before_action :authenticate_user!, only: [:new]

  def index
    @posts = Post.includes(:post_images).last(3).reverse
  end

  def new
    @post = Post.new
    @post.post_images.new
  end

  def create
    @post = Post.new(post_params)
    # 投稿内容のsaveと、画像が投稿されてるか確認！（今回の場合は1枚以上）
      if @post.post_images.present? && @post.save 
        redirect_to root_path
      else
        render :new
      end
  end

  def edit
    
  end

  def show
    @images = @post.post_images.includes(:post)
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
  
  def search
    respond_to do |format|
      format.html
      format.json do
        if params[:parent_id]
          @childrens = Category.find(params[:parent_id]).children
        elsif params[:children_id]
          @grandChilds = Category.find(params[:children_id]).children
        end
      end
    end
  end

  private
  def post_params
    params.require(:post).permit(:name, :introduce, :category_id, :user_address, :shipping, :price, :status, :delivery_status, post_images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def set_parents
    @parents = Category.where(ancestry: nil)
  end

end
