class AddProductCartId < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :product_cart_id, :integer
    add_column :products, :product_cart_id, :integer
  end
end
