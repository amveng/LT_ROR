class RenameTableColumnVotes < ActiveRecord::Migration[6.0]
  def change
    rename_column :votes, :listserver_id, :server_id
  end
end
