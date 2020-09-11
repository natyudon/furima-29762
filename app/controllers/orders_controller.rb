class OrdersController < ApplicationController
  before_action :product_id_params, only: [:index, :create]
  before_action :move_to_root, only: [:index]
  before_action :already_order, only: [:index]
  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item(@product.price)
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def product_id_params
    @product = Product.find(params[:product_id])
  end

  def order_params
    params.permit(:token, :postal_code, :prefecture_id, :municipalitie, :address, :building, :phone_number).merge(product_id: @product.id, user_id: current_user.id)
  end

  def pay_item(price)
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_root
    redirect_to root_path if current_user.id == @product.user_id
  end

  def already_order
    redirect_to root_path if @product.order
  end
end
