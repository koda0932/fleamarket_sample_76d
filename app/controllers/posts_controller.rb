class PostsController < ApplicationController
  before_action :set_post, except: [:index, :new, :create, :search, :items]
  before_action :set_parents, only: [:new, :create, :edit, :update]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :block_current_user, only: [:buy, :pay]
  before_action :set_payjp_card, only: [:buy, :pay]
  before_action :other_user, only: [:edit, :update, :destroy]
  before_action :purchased_block, only: [:edit, :update, :destroy]
  before_action :purchased_item, only: [:buy]

  def index
    @posts = Post.includes([:post_images, :user]).last(3).reverse
    @post_brands = PostBrand.all
  end

  def new
    @post = Post.new
    @post.post_images.new
    @post.post_brands.new
    @post_brand = PostBrand.new
  end

  def create
  @post = Post.create!(post_params)
    # 投稿内容のsaveと、画像が投稿されてるか確認！（今回の場合は1枚以上）
      if @post.post_images.present? && @post.save
        redirect_to root_path
      else
        @post.post_images.new
        flash.now[:alert] = "画像がありません"
        render :new
      end
  end

  def edit
  end

  def show
    @images = @post.post_images.includes(:post)
    # @post_brands = PostBrand.find(params[:id])
    if Transaction.where(buyer_id: current_user.id, post_id: @post.id).first
      @transaction = Transaction.where(buyer_id: current_user.id, post_id: @post.id).first
    end

  end

  def update
    # each do で並べた画像が image
    # 新しくinputに追加された画像が image_attributes
    # この二つがない時はupdateしない
    if params[:post].keys.include?("image") || params[:post].keys.include?("post_images_attributes")
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
        before_images_ids = @post.post_images.ids
        # @post.images.destroy = nil と削除されないので、each do で一つずつ削除する
        before_images_ids.each do |before_img_id|
          PostImage.find(before_img_id).destroy
        end
      end
      @post.update(post_params)
      redirect_to @post, notice: "更新しました"
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
    @address = UserAddress.find_by(user_id: current_user.id)
  end

  def pay
    @card = Card.find_by(user_id: current_user.id)
    customer = Payjp::Customer.retrieve(@card.customer_id)
    charge = Payjp::Charge.create(
    amount: @post.price,
    customer: customer.id,
    currency: 'jpy'
    )
    @post.update(purchased: true)
    # ここから取引ページを作成
    @transaction_room = TransactionRoom.create
    Transaction.create!(buyer_id: current_user.id, seller_id: @post.user_id, post_id: @post.id, transaction_room_id: @transaction_room.id)
    redirect_to @transaction_room, notice: '購入しました！'
  end

  def items
    @posts = Post.includes([:post_images, :user]).order('created_at desc')
  end

  private
  def post_params
    # params.require(:post).permit(:name, :introduce, :category_id, :user_address, :shipping, :price, :status, :delivery_status, post_images_attributes: [:image, :_destroy, :id], post_brands_attributes: [:id, :name]).merge(user_id: current_user.id)
    params.require(:post).permit(:name, :introduce, :category_id, :user_address, :shipping, :price, :status, :delivery_status, post_images_attributes: [:image, :id], post_brands_attributes: [:id, :name]).merge(user_id: current_user.id)
    # params.require(:post_brand).permit(:name)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def set_parents
    @parents = Category.where(ancestry: nil)
  end

  def purchased_item
    if @post.purchased == true
      redirect_to @post, notice: "その商品は既に購入されています"
    end
  end

  def block_current_user
    if @post.user_id == current_user.id
      flash[:alert] = "指定のページへは飛べません"
      redirect_to post_path
    end
  end

  def other_user
    if @post.user_id != current_user.id
      flash[:alert] = "指定されたアクションは動きません"
      redirect_to post_path
    end
  end

  def purchased_block
    redirect_to root_path, alert: "売却済みなので編集・削除はできません" if (@post.purchased == true)
  end

  def set_payjp_card
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
    if current_user.card.present?
      @card = Card.find_by(user_id: current_user.id)
    else
      redirect_to new_card_path, alert: "カード情報を登録してください"
    end
  end

end