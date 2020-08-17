class PostBrandsController < ApplicationController

def index
  @post_brands = PostBrand.includes(:post)
end

def show
  @post_brand = PostBrand.find_by(post_id: params[:id])
  # @posts = PostBrand.where(id: @post_brand.id)
  # @posts = Post.joins(:post_brand)
  # @posts = Post.joins(:post_brand).group_by(@post_brand)
  @posts = Post.where(id: @post_brand.post_id)
  # binding.pry
  # @posts = Post.post_brand
end


end
