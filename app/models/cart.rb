class Cart < ActiveRecord::Base
  has_many :cart_items
  has_many :items, through: :cart_items, source: :product

  def add_to_cart(product)
    ci = cart_items.build
    ci.product = product
    ci.save
  end

  def total_price
    sum = 0

    cart_items.each do |item|
      sum = sum + (item.quantity * item.product.price)
    end

    sum
  end

  def clean
    cart_items.destroy_all
  end

  def find_cart_item(product)
    cart_items.find_by(product_id: product)
  end

end
