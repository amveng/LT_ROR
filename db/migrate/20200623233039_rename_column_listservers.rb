class RenameColumnListservers < ActiveRecord::Migration[6.0]
  def change
    rename_column :listservers, :datestart, :datestart
    rename_column :listservers, :urlserver, :urlserver
  end
end
