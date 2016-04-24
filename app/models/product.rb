class Product < ActiveRecord::Base
  has_one :photo
  accepts_nested_attributes_for :photo
  has_many :cart_items
  has_many :sizes
  accepts_nested_attributes_for :sizes
  def update_quantity(quantity)
    self.update_columns(quantity: quantity)
  end
end
