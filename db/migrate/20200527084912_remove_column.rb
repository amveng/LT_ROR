class RemoveColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :listservers, :serverversion_id
  end
end
