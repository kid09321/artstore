module CartsHelper
  def find_cart_item(product)
    cart_items.find_by(product_id: product)
  end
end
