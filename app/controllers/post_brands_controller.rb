class PostBrandsController < ApplicationController

def index
  @post_brands = PostBrand.includes(:post)
end

def show
  @post_brand = PostBrand.find(params[:id])
  # @post_brand = PostBrand.find_by(post_id: params[:id])
  @posts = Post.where(id: @post_brand.post_id)
  # @posts = PostBrand.where(id: @post_brand.id)
  # @posts = Post.joins(:post_brand)
  # @posts = Post.joins(:post_brand).group_by(@post_brand)
end


end
