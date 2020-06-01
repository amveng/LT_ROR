class ChangeColumns < ActiveRecord::Migration[6.0]
  def change
    change_column :listservers, :version, :string, null: false
    change_column :listservers, :title, :string, null: false
    change_column :listservers, :urlServer, :string, null: false
    change_column :listservers, :dateStart, :date, null: false
    change_column :listservers, :rating, :decimal, precision: 3, scale: 2, default: 1
  end
end