class CartsController < ApplicationController
  def index
    @items = current_cart.items
  end
  def checkout
    @order = current_user.orders.build
    @info = @order.build_info
  end


end
