class AddColumn2 < ActiveRecord::Migration[6.0]
  def change
    add_reference :listservers, :serverversions
  end
end
