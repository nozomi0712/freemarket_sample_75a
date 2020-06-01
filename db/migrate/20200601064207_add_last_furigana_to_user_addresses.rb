class AddLastFuriganaToUserAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :user_addresses, :Last_furigana, :string
  end
end
