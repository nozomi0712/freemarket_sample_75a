class AddFirstFiriganaToUserAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :user_addresses, :first_furigana, :string
  end
end
