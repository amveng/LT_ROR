class DelField < ActiveRecord::Migration[6.0]
  def change
    remove_column :listservers, :hr
  end
end
