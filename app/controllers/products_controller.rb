class ProductsController < ApplicationController
  before_action :authenticate_user!,except: [:index, :show ]
  before_action :product_find, only: [:show, :edit, :update, :destroy ]
  before_action :move_to_index, only: [:edit, :update, :destroy ]

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

  def show
    
  end

  def edit
    
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product.id)
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :info,:category_id,:sales_status_id,:shipping_fee_status_id,:prefecture_id,:scheduled_delivery_id, :price, :user_id).merge(user_id: current_user.id)
  end

  def product_find
    @product = Product.find(params[:id])
  end

  def move_to_index
    redirect_to root_path if @product.user_id != current_user.id || @product.order.present?
  end
end
