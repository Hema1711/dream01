class CartQuantity < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :product_size, :string
    remove_column :products, :product_cart_id, :integer

    add_column :carts, :product_name, :integer
    add_column :carts, :product_description, :integer
    add_column :carts, :product_price, :integer
    add_column :carts, :product_image1, :integer

  end
end
