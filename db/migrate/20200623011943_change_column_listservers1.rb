class ChangeColumnservers1 < ActiveRecord::Migration[6.0]
  def change
    change_column :servers, :datestart, :datetime
  end
end
