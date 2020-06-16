class ChangeColumnPoll2 < ActiveRecord::Migration[6.0]
  def change
    change_column :polls, :created_at, :datetime
    add_column :polls, :date, :date
  end
end
