class AddStatusExpiresForServers < ActiveRecord::Migration[6.0]
  def change
    add_column :servers, :status_expires, :date, null: false, default: '2020-01-01'
  end
end
