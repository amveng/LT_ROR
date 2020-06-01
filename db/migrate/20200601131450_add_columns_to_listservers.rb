class AddColumnsToListservers < ActiveRecord::Migration[6.0]
  def change
    add_column :listservers, :status, :string, null: false, default: 'normal'
  end
end
