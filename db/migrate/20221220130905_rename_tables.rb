class RenameTables < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :password, :string
    remove_column :users, :language, :string

    remove_column :products, :price, :integer
    remove_column :products, :quantity, :integer

    add_column :products, :product_description, :string

    change_column :users, :address_id, :integer

  

  end
end
