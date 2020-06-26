class AddColumnsToservers2 < ActiveRecord::Migration[6.0]
  def change
    add_column :servers, :version, :string
    add_column :servers, :title, :string
    add_column :servers, :urlserver, :string
    add_column :servers, :datestart, :date
  end
end
