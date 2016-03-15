class CartsController < ApplicationController

  def index
    @items = current_cart.items
  end

  def checkout
    @order = current_user.orders.build
    @info = @order.build_info
  end

  def clean
    current_cart.clean
    redirect_to products_path, notice: "清除購物車成功"
  end

end
