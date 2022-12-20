class AddTables < ActiveRecord::Migration[7.0]
  def change
    

    remove_column :user_addresses, :user_id, :integer
    remove_column :user_addresses, :address_id, :integer


    remove_column :addresses, :city_id, :integer
    remove_column :addresses, :district_id, :integer
    remove_column :addresses, :country_id, :integer
    remove_column :addresses, :state_id, :integer

    add_column :addresses, :city_id, :string
    add_column :addresses, :district_id, :string
    add_column :addresses, :country_id, :string
    add_column :addresses, :state_id, :string

    add_column :users, :address_id, :string


  end
end
