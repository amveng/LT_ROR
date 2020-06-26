class AddFieldRateForServers < ActiveRecord::Migration[6.0]
  def change
    add_column :servers, :rate, :integer, null: false, default: 1
  end
end
