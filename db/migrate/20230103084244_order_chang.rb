class OrderChang < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :cart_unique_id, :string
  end
end
