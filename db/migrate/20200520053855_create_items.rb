class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :item_name, null:false
      t.string :explanation, null:false
      t.integer :price, null:false
      t.string :bland
      t.string :condition, null:false
      t.references :user_id, null:false
      t.string :ship_date, null:false
      t.integer :delivery_fee, null:false
      t.timestamps
    end
  end
end
