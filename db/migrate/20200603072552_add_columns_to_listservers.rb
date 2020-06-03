class AddColumnsToListservers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :baned, :boolean, default: false, null: false
  end
end
