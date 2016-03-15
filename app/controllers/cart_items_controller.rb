class CartItemsController < ApplicationController
  def destroy
    @item = current_cart.find_cart_item(params[:id])
    @product = @item.product.title
    @item.destroy
    redirect_to carts_path, notice: "成功清除#{@product}"
  end

  def update
    @item = current_cart.find_cart_item(params[:id])
    if current_cart.items.quantity >= item_params[:quantity].to_i
      @item.update(item_params)
      flash[:notice] = "更改數量成功"
    else
      flash[:alert] = "庫存不足"
    end
    redirect_to carts_path
  end
  private

  def item_params
    params.require(:cart_item).permit(:quantity)
  end


end
