class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product
  validates :quantity, presence: true
  validates :size, presence: true
end
