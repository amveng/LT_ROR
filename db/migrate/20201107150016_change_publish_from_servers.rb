class ChangePublishFromServers < ActiveRecord::Migration[6.0]
  def change
    remove_column :servers, :publish
    add_column :servers, :publish, :integer, default: 0, null: false
  end
end
