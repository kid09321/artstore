class OrderPlacingService
  def initialize(cart, order)
    @order = order
    @cart = cart
  end

  def place_order!
    @order.build_item_cache_from_cart(@cart)
    @order.calculate_total(@cart)
    @cart.clean!
    OrderMailer.delay.notify_order_placed(@order)
    #以上整串是一個下單行為 因此把這個行為放到services裡面寫成class
  end
end
