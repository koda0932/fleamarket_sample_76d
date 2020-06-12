class PostsController < ApplicationController
  before_action :set_post, except: [:index, :new, :create]
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
    # if @post.post_images.present?
      if @post.save
        redirect_to root_path
      else
        # render partial:"form" ,locals: {post:new}
        render action: :new
      end
    # else
      # render partial:"form" ,locals: {post:new}
      # render :new
      # render action: :new
    # end
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

#   def update
#     @parents = Category.where(ancestry: nil)
    
#     if params[:post].keys.include?("image") || params[:post].keys.include?("images_attributes")
#       if @post.valid?
#         if params[:post].keys.include?("image")
#           update_images_ids = params[:post][:image].values
#           before_images_ids = @post.post_images.ids

#           before_images_ids.each do |before_img_id|
#             Image.find(before_img_id).destroy unless update_images_ids.include?("#{before_img_id}")
#           end
#         else
#           before_images_ids.each do |before_img_id|
#             Image.find(before_img_id).destroy 
#           end
#       end

#       @post.update(post_params)
#       # @size = @post.categories[1].sizes[0]
#       # @post.update(size: nil) unless @size
#       redirect_to root_path, notice: "更新しました"
#     else
#       render 'edit'
#     end
#   else
#     redirect_back(fallback_location: root_path,flash: {success: '画像がありません'})
#   end
# end

  def destroy
    if @post.destroy
      redirect_to root_path
    else
      render :edit
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
    # @parents = Category.all.order("id asc").limit(13)
  end

end
