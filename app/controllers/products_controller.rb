class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_product_to_cart
    @product = Product.find(params[:id])
    if !current_cart.items.include?(@product)
      current_cart.add_to_cart(@product)
      flash[:notice] = "此物品成功加入購物車"
    else
      flash[:warning] = "此物品先前已被加過"
    end
    redirect_to product_path(@product)
  end
end
