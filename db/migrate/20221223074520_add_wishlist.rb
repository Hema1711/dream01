class AddWishlist < ActiveRecord::Migration[7.0]
  def change
    add_column :wishlists, :product_unique_id, :string
    add_column :wishlists, :user_unique_id, :string

     
    remove_column :orders, :cart_id, :string
    remove_column :orders, :user_id, :string

    add_column :orders, :cart_unique_id, :string
    add_column :orders, :user_unique_id, :string
  end
end
