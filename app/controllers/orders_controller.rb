class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :product_find, only: [:index, :create]
  before_action :user_check, only: [:index, :create]

  def index
    @order = OrderDestination.new
  end

  def create
    @order = OrderDestination.new(order_destination_params)
    
    if @order.valid?
      pay_product
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_destination_params
    params.require(:order_destination).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end
  
  def pay_product
    Payjp.api_key = "sk_test_78e99efcd982c9e45a72ec4e"
    Payjp::Charge.create(
      amount: @product.price,
      card: order_destination_params[:token],
      currency: 'jpy'
    )
  end

  def product_find
    @product = Product.find(params[:product_id])
  end

  def user_check
    redirect_to root_path if current_user == @product.user || @product.order.present?
  end

end