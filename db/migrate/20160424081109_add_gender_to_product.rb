class AddGenderToProduct < ActiveRecord::Migration
  def change
    add_column :products, :gender, :string
  end
end
