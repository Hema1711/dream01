class UserDetail < ActiveRecord::Migration[7.0]
  def change
    add_column :user_details, :password_digest, :string
    add_column :user_details, :unique_id, :string
    add_column :user_details, :country, :string
    add_column :user_details, :state, :string
    add_column :user_details, :city, :string
    add_column :user_details, :pincode, :integer
    add_column :user_details, :first_name, :string
    add_column :user_details, :last_name, :string
    add_column :user_details, :email, :string
    add_column :user_details, :phone_number, :integer
    add_column :user_details, :file_extension, :string
    add_column :user_details,  :cart_unique_id, :string
    add_column :user_details, :is_active, :boolean, default: true
    add_column :user_details, :is_owner, :boolean, default: false
    add_column :user_details, :is_user, :boolean, default: true
  end
end
