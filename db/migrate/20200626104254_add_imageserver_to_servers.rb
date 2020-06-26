class AddImageserverToServers < ActiveRecord::Migration[6.0]
  def change
    add_column :servers, :imageserver, :string
  end
end
