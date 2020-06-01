class AddLastNameToUserAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :user_addresses, :Last_name, :string
  end
end
