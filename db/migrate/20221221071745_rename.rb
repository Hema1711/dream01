class Rename < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :unique_id, :string
    add_column :users, :country, :string
    add_column :users, :state, :string
    add_column :users, :city, :string
    add_column :users, :pincode, :integer

    remove_column :addresses, :city_id, :string
    remove_column :addresses, :district_id, :string
    remove_column :addresses, :country_id, :string
    remove_column :addresses, :state_id, :string

    add_column :addresses, :city, :string
    add_column :addresses, :country, :string
    add_column :addresses, :state, :string
  end
end
