class Addfield2 < ActiveRecord::Migration[6.0]
  def change
    add_column :listservers, :version, :string
  end
end
