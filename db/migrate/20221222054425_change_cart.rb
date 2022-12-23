class ChangeCart < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :product_unique_id, :string
    remove_column :carts, :total_items, :integer
    remove_column :carts, :sub_total, :integer
    remove_column :carts, :total_unique_items, :integer
    remove_column :carts, :available_discounts, :boolean
    remove_column :carts, :currency, :string
    remove_column :carts, :user_id, :integer
    remove_column :carts, :product_cart_id, :integer

    add_column :carts, :product_unique_id, :string
    add_column :carts, :user_unique_id, :string
    add_column :carts, :cart_unique_id, :string
    add_column :orders, :order_unique_id, :string
    add_column :deliveries, :delivery_unique_id, :string

  end
end

