class ProductsController < ApplicationController
  before_action :params_id, only: [:show, :edit,:update]
  
  def index
    @product = Product.all.order('created_at DESC')
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
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  private

  def params_id
    @product = Product.find(params[:id])
  end
  def product_params
    params.require(:product).permit(:name, :content, :price, :image, :category_id, :state_id, :delivery_fee_id, :area_id, :delivery_day_id).merge(user_id: current_user.id)
  end
end
