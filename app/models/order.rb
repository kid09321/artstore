class Order < ActiveRecord::Base
  belongs_to :user
  has_many :items, class_name: "OrderItem", dependent: :destroy
  has_one :info, class_name: "OrderInfo", dependent: :destroy
  accepts_nested_attributes_for :info
  include AASM
  include Tokenable
  aasm do
    state :order_placed, initial: true
    state :paid
    state :shipping
    state :shipped
    state :good_returned
    state :order_cancelled

    event :make_payment, after_commit: :pay! do
      transitions from: :order_placed, to: :paid
    end
    event :ship do
      transitions from: :paid, to: :shipping
    end
    event :deliver do
      transitions from: :shipping, to: :shipped
    end
    event :cancel_order do
      transitions from: [:order_placed, :paid], to: :cancel_order
    end
    event :return_good do
      transitions from: :shipped, to: :good_returned
    end
  end


  def build_item_cache_from_cart(cart)
    cart.items.each do |product|
    item = items.build
    item.product_name = product.title
    item.quantity = cart.cart_items.find_by(product_id: product).quantity
    item.price = product.price
    item.save
    end
  end

  def calculate_total(cart)
    self.total = cart.total
    self.save
  end

  def set_payment_with(method)
    self.update_columns(payment_method: method)
  end

  def pay!
    self.update_columns(is_paid: true)
  end
end
