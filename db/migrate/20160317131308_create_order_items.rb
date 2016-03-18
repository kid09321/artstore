class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.string :product_name
      t.integer :order_id
      t.integer :quantity
      t.integer :price

      t.timestamps null: false
    end
  end
end
