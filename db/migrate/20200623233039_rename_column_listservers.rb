class RenameColumnListservers < ActiveRecord::Migration[6.0]
  def change
    rename_column :listservers, :dateStart, :datestart
    rename_column :listservers, :urlServer, :urlserver
  end
end
