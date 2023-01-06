class Quantity < ActiveRecord::Migration[7.0]
  def change
    remove_column :carts, :product_name, :integer
    remove_column :carts, :product_description, :integer
    remove_column :carts, :product_price, :integer
    remove_column :carts, :product_image1, :integer


    add_column :carts, :product_name, :string
    add_column :carts, :product_description, :string
    add_column :carts, :product_price, :integer
    add_column :carts, :product_image1, :string
    add_column :carts, :product_quantity, :integer,default: 1
  end
end
