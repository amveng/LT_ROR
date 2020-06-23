class ChangeTypeFieldStatus < ActiveRecord::Migration[6.0]
  def change
    remove_column :listservers, :status
    add_column :listservers, :status, :integer, default: 3, null: false
  end
end
