class AddFailedForServers < ActiveRecord::Migration[6.0]
  def change
    add_column :servers, :failed, :text
  end
end
