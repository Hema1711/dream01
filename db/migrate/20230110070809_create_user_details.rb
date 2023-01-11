class CreateUserDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :user_details do |t|

      t.timestamps
    end
  end
end
