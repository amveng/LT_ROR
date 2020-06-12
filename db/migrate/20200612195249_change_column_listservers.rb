class ChangeColumnListservers < ActiveRecord::Migration[6.0]
  def change
    change_column :listservers, :title, :string, limit: 42

    # add_index :listservers, :title, unique: true
  end
end
