class RenameColumnVotetimeToNextVotetime < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :votetime, :next_votetime
  end
end
