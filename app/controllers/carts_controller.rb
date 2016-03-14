class CartsController < ApplicationController

  def index
    @items = current_cart.items
  end
end
