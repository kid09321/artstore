module CartItemsHelper
  def render_each_item_total_price(product)
    product.price * current_cart.cart_items.find_by(product_id: product).quantity
  end
end
