class AddTokenToServers < ActiveRecord::Migration[6.0]
  def change
    add_column :servers, :token, :string
  end
end
