class AddIndexForservers < ActiveRecord::Migration[6.0]
  def change
    add_index :servers, :title, unique: true
  end
end
