class AddTotalToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :total, :integer, default: 0
  end
end
