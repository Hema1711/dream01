class RemoveProduct < ActiveRecord::Migration[7.0]
  def change
    remove_column :carts, :product_id, :integer
  end
end
