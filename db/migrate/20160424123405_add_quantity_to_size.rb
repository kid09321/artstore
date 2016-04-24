class AddQuantityToSize < ActiveRecord::Migration
  def change
    add_column :sizes, :quantity, :integer, default: 1
  end
end
