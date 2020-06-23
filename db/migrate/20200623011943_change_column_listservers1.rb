class ChangeColumnListservers1 < ActiveRecord::Migration[6.0]
  def change
    change_column :listservers, :datestart, :datetime
  end
end
