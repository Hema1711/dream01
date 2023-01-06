class WishlistChanges < ActiveRecord::Migration[7.0]
  def change
    add_column :wishlists, :product_name, :string
    add_column :wishlists, :product_description, :string
    add_column :wishlists, :product_price, :integer
    add_column :wishlists, :product_image1, :string
    add_column :wishlists, :product_quantity, :integer,default: 1
  end
end
