class ChangeColumnservers < ActiveRecord::Migration[6.0]
  def change
    change_column :servers, :title, :string, limit: 42

    # add_index :servers, :title, unique: true
  end
end
