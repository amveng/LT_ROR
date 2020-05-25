class RemoveColumn2 < ActiveRecord::Migration[6.0]
  def change
    remove_column :listservers, :serverversions_id
  end
end
