class OrdersController < ApplicationController
  before_action :product_id_params, only: [:index, :create]
  before_action :move_to_root, only: [:index]
  before_action :already_order, only: [:index]
  def index
    @order_address = OrderAddress.new
  end

  def create
    if params[:card_token] == '0'
      @order_address = OrderAddress.new(order_params)
      if @order_address.valid?
        pay_item(@product.price)
        @order_address.save
        redirect_to root_path
      else
        render :index
      end
    end

    if params[:card_token] == '1' && current_user.card.nil?
      flash[:notice] = 'クレジットカードが登録されていません。'
      redirect_to product_orders_path(@product)
      return
    end
    if params[:card_token] == '1'
      @order_address = OrderAddress.new(order_token_params)
      if @order_address.valid?
        save_token_pay_item(@product.price)
        @order_address.save
        redirect_to root_path
      else
        render :index
      end
    end
  end

  private

  def product_id_params
    @product = Product.find(params[:product_id])
  end

  def order_params
    params.permit(:token, :postal_code, :prefecture_id, :municipalitie, :address, :building, :phone_number).merge(product_id: @product.id, user_id: current_user.id)
  end

  def order_token_params
    params.permit(:postal_code, :prefecture_id, :municipalitie, :address, :building, :phone_number).merge(token: current_user.card.card_token, product_id: @product.id, user_id: current_user.id)
  end

  def pay_item(price)
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def save_token_pay_item(price)
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    customer_token = current_user.card.customer_token
    Payjp::Charge.create(
      amount: price,
      customer: customer_token,
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
