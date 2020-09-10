class OrdersController < ApplicationController
  def index
    @order_address = OrderAddress.new
    @product = Product.find(params[:product_id])
  end
  def create
    @product = Product.find(params[:product_id])
    @order_address = OrderAddress.new(
      postal_code: order_params[:postal_code],
      prefecture_id: order_params[:prefecture_id],
      municipalitie: order_params[:municipalitie],
      address: order_params[:address],
      building: order_params[:building],
      phone_number: order_params[:phone_number],
      product_id: order_params[:product_id]
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

  def order_params
    params.permit(:token,:postal_code, :prefecture_id,:municipalitie, :address, :building, :phone_number).merge(product_id: @product.id)
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
