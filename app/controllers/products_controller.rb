class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.items.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "成功加入購物車"
    else
      flash[:alert] = "此商品之前已加入過購物車"
    end
    redirect_to product_path(@product)
  end
end
