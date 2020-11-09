class RenameColumnFailedToServers < ActiveRecord::Migration[6.0]
  def change
    rename_column :servers, :failed, :failure_message
  end
end
