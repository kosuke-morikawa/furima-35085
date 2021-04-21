class ProductsController < ApplicationController
  before_action :authenticate_user!,only: [:new, :create, :edit, :update, :destroy]
  def index
    @products = Product.order('created_at DESC')
  end
  
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end
end
