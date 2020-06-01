class AddFirstNameToUserAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :user_addresses, :first_name, :string
  end
end
