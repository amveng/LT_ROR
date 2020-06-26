class AddDescriptionToServers < ActiveRecord::Migration[6.0]
  def change
    add_column :servers, :description, :text, limit: 500
  end
end
