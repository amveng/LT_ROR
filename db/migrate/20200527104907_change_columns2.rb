class ChangeColumns2 < ActiveRecord::Migration[6.0]
  def change
    change_column :servers, :version, :string
    change_column :servers, :title, :string
    change_column :servers, :urlserver, :string
    change_column :servers, :datestart, :date
  end
end
