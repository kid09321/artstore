class Admin::OrdersController < AdminController

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.items
    @order_info = @order.info
  end

  def ship
    @order = Order.find(params[:id])
    @order.ship!
    redirect_to admin_order_path(@order)
  end

  def return
    @order = Order.find(params[:id])
    @order.return_good!
    redirect_to admin_order_path(@order)
  end

  def cancel
    @order = Order.find(params[:id])
    @order.cancel_order!
    redirect_to admin_order_path(@order)
  end

  def shipped
    @order = Order.find(params[:id])
    @order.deliver!
    redirect_to admin_order_path(@order)
  end
end
