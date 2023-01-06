class UserCor < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :cart_unique_id, :string
    add_column :users, :is_owner, :boolean, default: false
    add_column :users, :is_user, :boolean, default: true
  end
end
