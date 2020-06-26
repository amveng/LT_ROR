class ChangeColumn < ActiveRecord::Migration[6.0]
  def change
    change_column :servers, :publish, :boolean, null: false, default: false
  end
end
