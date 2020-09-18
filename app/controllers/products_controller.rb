class ProductsController < ApplicationController
  before_action :params_id, only: [:show, :edit, :update, :destroy]

  def index
    @product = Product.all.order('created_at DESC')
    @order = Order.all
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

  # show/editアクションはbefore_actionで呼び出している処理のみのため、アクションを定義していない
  # railsはroutes.rbに定義してあるパス・メソッドに対応する、viewファイルがあれば、controllerに書く必要がないため
  def update
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def params_id
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :content, :price, {images: []}, :category_id, :state_id, :delivery_fee_id, :area_id, :delivery_day_id).merge(user_id: current_user.id)
  end
end
