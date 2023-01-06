class Changes < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :is_active, :boolean, default: true
    add_column :users, :is_active, :boolean, default: true
    add_column :products,:is_active, :boolean, default: true
    add_column :wishlists,:is_active, :boolean, default: true

  end
end
