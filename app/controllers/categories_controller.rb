class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @posts = []
    @all_posts = Post.includes([:post_images, :category])
    # postsを1個ずつ取り出す。category_idかparent_idかroot_idが同じなら配列postsに代入
    @all_posts.each do |post|
      # if post.category.id == @category.id
      #   @posts << post
      # elsif post.category.parent_id == @category.id
      #   @posts << post
      # elsif post.category.root_id == @category.id
      #   @posts << post
      # end

      case post.category_id
      when post.category_id == @category.id
        @posts << post
      when post.category.parent_id == @category.id
        @posts << post
      when true
        @posts << post
        binding.pry
      else
        @p = post.category.root
        @c = post.category.parent
        @g = post.category
      end

    end

        # case post
        # when post.category.id == @category.id
        #   @posts << post
        # when post.category.parent_id == @category.id
        #   @posts << post
        # when post.category.root_id == @category.id
        #   @posts << post
        #   binding.pry
        # else
        #   @p = post.category.root
        #   @c = post.category.parent
        #   @g = post.category

  end
end
