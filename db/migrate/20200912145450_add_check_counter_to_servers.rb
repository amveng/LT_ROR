class AddCheckCounterToServers < ActiveRecord::Migration[6.0]
  def change
    add_column :servers, :failed_checks, :integer, default: 0, null: false
  end
end
