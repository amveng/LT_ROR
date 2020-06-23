class ChangeColumns2 < ActiveRecord::Migration[6.0]
  def change
    change_column :listservers, :version, :string
    change_column :listservers, :title, :string
    change_column :listservers, :urlserver, :string
    change_column :listservers, :datestart, :date
  end
end
