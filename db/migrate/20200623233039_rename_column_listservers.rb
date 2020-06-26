class RenameColumnservers < ActiveRecord::Migration[6.0]
  def change
    rename_column :servers, :datestart, :datestart
    rename_column :servers, :urlserver, :urlserver
  end
end
