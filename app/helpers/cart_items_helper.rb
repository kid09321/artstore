module CartItemsHelper
  def render_each_item_total_price(cart_item)
    cart_item.product.price * cart_item.quantity
  end
end
