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
        @post.post_images.new
        render :new
        flash.now[:alert] = "画像がありません"
      end
  end

  def edit
  end

  def show
    @images = @post.post_images.includes(:post)
  end

  def edit
    
  end

  def update
    # each do で並べた画像が image
    # 新しくinputに追加された画像が image_attributes
    # この二つがない時はupdateしない
    if params[:post].keys.include?("image") || params[:post].keys.include?("images_attributes")
      if @post.valid?
        if params[:post].keys.include?("image")
        # dbにある画像がedit画面で一部削除してるか確認
          update_images_ids = params[:post][:image].values #投稿済み画像 
          before_images_ids = @post.post_images.ids

          # 商品に紐づく投稿済み画像が、投稿済みにない場合は削除する
          # before_images_ids.each doで、一つずつimageハッシュにあるか確認。なければdestroy
          before_images_ids.each do |before_img_id|
            PostImage.find(before_img_id).destroy unless update_images_ids.include?("#{before_img_id}")
          end
        else
           # imageハッシュがない = 投稿済みの画像をすべてedit画面で消しているので、商品に紐づく投稿済み画像を削除する。
            before_images_ids.each do |before_img_id|
            PostImage.find(before_img_id).destroy 
          end
      end
      @post.update(post_params)
      redirect_to root_path, notice: "更新しました"

    else
      flash.now[:alert] = "画像がありません"
      render 'edit'
    end

  else
    flash.now[:alert] = "画像がありません"
    render 'edit'
  end
end


  def destroy
    if @post.destroy
      redirect_to root_path, notice: "投稿を削除しました"
    else
      flash.now[:alert] = "削除に失敗しました"
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

  def buy
    @address = UserAddress.where(user_id: current_user.id).first
  end
  
  def pay
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
    charge = Payjp::Charge.create(
    amount: @post.price,
    card: params['payjp-token'],
    currency: 'jpy'
    )
    @post.update(purchased: true)
    redirect_to root_path, notice: '購入しました！'
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
