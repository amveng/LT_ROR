class AddColumn4 < ActiveRecord::Migration[6.0]
  def change
    add_column :listservers, :hr, :string
  end
end
