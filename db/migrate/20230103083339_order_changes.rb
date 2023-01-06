class OrderChanges < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :cart_unique_id, :string

    remove_column :orders, :quantity, :integer
    
  end
end
