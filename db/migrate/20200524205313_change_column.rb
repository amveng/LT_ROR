class ChangeColumn < ActiveRecord::Migration[6.0]
  def change
    change_column :listservers, :dateStart, :date
  end
end
