module ApplicationHelper
  def notice_message
    alert_types = {notice: :success,alert: :danger}

    close_button_options = { class: "close", "data-dismiss" => "alert", "aria-hidden" => true}
    close_button = content_tag(:button, "x", close_button_options)

    alerts = flash.map do |type, msg|
      alert_type = alert_types[type.to_sym] || type
      alert_class = "alert alert-#{alert_type} alert-dismissable"
      alert_content = close_button + msg
      content_tag(:div, alert_content, class: alert_class)
    end
    alerts.join("\n").html_safe
  end

  def render_cart_items_count(cart)
    cart.cart_items.count
  end

  def render_cart_total_price(cart)
    cart.total
  end

  def comments
    url = 'https://blooming-ocean-22766.herokuapp.com/products/#{@product.id}'
    content_tag(:div,'',class: "fb-comments", 'data-href' => url, 'data-width='=> '500px;', 'data-numposts'=>'5')
  end
end
