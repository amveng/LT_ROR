class ChangeColumnsToservers2 < ActiveRecord::Migration[6.0]
  def change
    remove_column :servers, :version
    remove_column :servers, :title
    remove_column :servers, :urlserver
    remove_column :servers, :datestart
  end
end
