class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :pay2go_cc_notify

  protect_from_forgery except: :pay2go_cc_notify

  def create
    @order = current_user.orders.build(order_params)
    if @order.save
      # @order.build_item_cache_from_cart(current_cart)
      # @order.calculate_total(current_cart)
      # current_cart.clean!
      OrderPlacingService.new(current_cart, @order).place_order!

      redirect_to order_path(@order.token)
    else
      render "carts/checkout"
    end
  end

  def show
    @order =  current_user.orders.find_by_token(params[:id])
    @order_items = @order.items
    @order_info = @order.info
  end

  # def pay_with_credit_card
  #   @order = current_user.orders.find_by_token(params[:id])
  #   @order.set_payment_with("credit card")
  #   @order.make_payment!
  #   current_cart.clean!
  #   OrderMailer.notify_order_placed(@order).deliver!
  #   redirect_to account_orders_path, notice: "完成付款"
  # end
# current_cart.cart_items.each do |cart_item|
      #   remain_quantity = (cart_item.product.quantity - cart_item.quantity)
      #   cart_item.product.update_quantity(remain_quantity)
      # end
  def pay2go_cc_notify #刷卡完成後回傳成功或失敗(所以是post)
    @order = Order.find_by_token(params[:id])

    if params["Status"] == "SUCCESS"
      @order.set_payment_with("credit card")
      @order.make_payment!

      if @order.is_paid?
        flash[:notice] = "信用卡付款成功"
        redirect_to account_orders_path
      else
        render text: "信用卡失敗"
      end
    else
      render text: "交易失敗"
    end
  end

  def pay2go_atm_complete
    @order = Order.find_by_token(params[:id])
    json_data = JSON.parse(params["JSONData"])

   if json_data["Status"] == "SUCCESS"

      @order.set_payment_with("atm")
      @order.make_payment!

      render text: "交易成功"
    else
      render text: "交易失敗"
    end
  end
private
  def order_params
    params.require(:order).permit(info_attributes: [:billing_name, :billing_address, :shipping_name, :shipping_address])
  end
end
