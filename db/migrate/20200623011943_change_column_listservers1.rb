class ChangeColumnListservers1 < ActiveRecord::Migration[6.0]
  def change
    change_column :listservers, :dateStart, :datetime
  end
end
