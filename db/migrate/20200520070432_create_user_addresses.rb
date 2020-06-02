class CreateUserAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :user_addresses do |t|
      t.string :post, null:false
      t.string :preficture, null:false
      t.string :city, null:false
      t.string :block, null:false
      t.string :building
      t.string :tell_number
      t.string :first_name, null: false, default: ""
      t.string :first_furigana, null: false, default: ""
      t.string :last_name, null: false, default: ""
      t.string :last_furigana, null: false, default: ""
      t.references :user, null:false
      t.timestamps
    end
  end
end
