class CartsController < ApplicationController

  def index
    @items = current_cart.items
  end

  def checkout
    if !current_cart.cart_items.present?
      redirect_to carts_path, alert: "你尚未選購商品"
    else
      @order = current_user.orders.build
      @info = @order.build_info
    end
  end

  def clean
    @cart = current_cart
    if @cart.cart_items.present?
      @cart.clean!
      flash[:notice] = "已清空購物車"
    else
      flash[:alert] = "購物車已經是空的了"
    end
    redirect_to carts_path
    end

end
