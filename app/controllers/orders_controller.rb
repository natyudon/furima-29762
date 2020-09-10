class OrdersController < ApplicationController
  def index
    @order = Order.new
    @product = Product.find(params[:product_id])
  end
  def create
    @product = Product.find(params[:product_id])
    @order_address = OrderAddress.new(order_params [:postal_code],[:prefecture_id],[:municipalitie], [:address], [:building], [:phone_number])
    if @order_address.valid?
      pay_item
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

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end
end
