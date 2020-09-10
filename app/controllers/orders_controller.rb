class OrdersController < ApplicationController
  before_action :product_id_params, only: [:index, :create]
  def index
    @order_address = OrderAddress.new
  end
  def create
    @order_address = OrderAddress.new(
      postal_code: order_params[:postal_code],
      prefecture_id: order_params[:prefecture_id],
      municipalitie: order_params[:municipalitie],
      address: order_params[:address],
      building: order_params[:building],
      phone_number: order_params[:phone_number],
      product_id: order_params[:product_id],
      user_id: order_params[:user_id]
      )
    if @order_address.valid?
      pay_item(@product.price)
      @order_address.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private
  def product_id_params
    @product = Product.find(params[:product_id])
  end
  def order_params
    params.permit(:token,:postal_code, :prefecture_id,:municipalitie, :address, :building, :phone_number).merge(product_id: @product.id,user_id: current_user.id)
  end

  def pay_item(price)
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: price,
      card: order_params[:token],
      currency:'jpy'
    )
  end
end
