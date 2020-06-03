class AddColumnsToListservers2 < ActiveRecord::Migration[6.0]
  def change
    add_column :listservers, :version, :string
    add_column :listservers, :title, :string
    add_column :listservers, :urlServer, :string
    add_column :listservers, :dateStart, :date
  end
end
