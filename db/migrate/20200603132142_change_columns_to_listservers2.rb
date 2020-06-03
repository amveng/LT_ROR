class ChangeColumnsToListservers2 < ActiveRecord::Migration[6.0]
  def change
    remove_column :listservers, :version
    remove_column :listservers, :title
    remove_column :listservers, :urlServer
    remove_column :listservers, :dateStart
  end
end
