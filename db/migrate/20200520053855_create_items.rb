class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :item_name, null:false
      t.string :explanation, null:false
      t.integer :price, null:false
      t.string :brand
      t.integer :condition_id, null:false
      t.references :user, null:false
      t.string :ship_date, null:false
      t.string :delivery_fee, null:false
      t.timestamps
    end
  end
end
