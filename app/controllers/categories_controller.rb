class CategoriesController < ApplicationController
  def index

  end

  def show
    @category = Category.find(params[:id])
    # @all_posts = Post.include([:user, :category, :post_image])

    # @all_posts.each do |post|
    #   post.category
    # end

    # if @category.parent.parent.present?
    #   @posts = Post.where(category_id: @category.id)
    # elsif @category.parent.present?
    #   @posts = Post.where(category_id: @category.id)
    # else
    #   @posts = Post.where(category_id: @category.id)
    # end
  end
end
