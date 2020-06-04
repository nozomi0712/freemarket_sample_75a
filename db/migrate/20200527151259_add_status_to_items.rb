class AddStatusToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :status, :boolean, default: 1, null: false

  end
end
