class ChangeColumnPoll < ActiveRecord::Migration[6.0]
  def change
    change_column :polls, :created_at, :date
  end
end
