class ChangeTypeFieldStatus < ActiveRecord::Migration[6.0]
  def change
    remove_column :servers, :status
    add_column :servers, :status, :integer, default: 3, null: false
  end
end
