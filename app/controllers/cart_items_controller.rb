class CartItemsController < ApplicationController

  def destroy
    @cart_item = current_cart.cart_items.find_by(product_id: params[:id])
    @cart_item.destroy
    redirect_to carts_path
  end

  def update
    @cart = current_cart
    @cart_item = @cart.find_cart_item(params[:id])
    if @cart_item.product.quantity >= item_params[:quantity].to_i
      @cart_item.update(item_params)
    else
      flash[:notice] = "超出庫存數量"
    end
    redirect_to carts_path
  end

  private

  def item_params
    params.require(:cart_item).permit(:quantity,:size)
  end
end
