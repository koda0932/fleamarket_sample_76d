class PostBrandsController < ApplicationController

def index
  @post_brands = PostBrand.all
end

def new
  @post_brand = PostBrand.new
end

def create
  PostBrand.create(post_brand_params)
  @post_brand.save
end

end
