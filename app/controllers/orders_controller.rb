class OrdersController < ApplicationController
  def index
    @order = Order.new
    @product = Product.find(params[:product_id])
  end
end
