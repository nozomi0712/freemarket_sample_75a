class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :item_name, null:false
      t.string :explanation, null:false
      t.integer :price, null:false
      t.integer :brand_id
      t.integer :condition_id, null:false
      t.references :user, null:false
      t.integer :ship_date_id, null:false
      t.integer :delivery_fee_id, null:false
      t.timestamps
    end
  end
end
