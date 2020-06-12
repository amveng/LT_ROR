class AddIndexForListservers < ActiveRecord::Migration[6.0]
  def change
    add_index :listservers, :title, unique: true
  end
end
