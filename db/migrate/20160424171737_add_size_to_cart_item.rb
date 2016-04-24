class AddSizeToCartItem < ActiveRecord::Migration
  def change
    add_column :cart_items, :size, :string
  end
end
