class AddProductIdToSize < ActiveRecord::Migration
  def change
    add_column :sizes, :product_id, :integer
  end
end
