class ChangeColumns < ActiveRecord::Migration[6.0]
  def change
    change_column :servers, :version, :string, null: false
    change_column :servers, :title, :string, null: false
    change_column :servers, :urlserver, :string, null: false
    change_column :servers, :datestart, :date, null: false
    change_column :servers, :rating, :decimal, precision: 3, scale: 2, default: 1
  end
end
