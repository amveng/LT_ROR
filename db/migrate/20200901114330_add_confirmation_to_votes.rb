class AddConfirmationToVotes < ActiveRecord::Migration[6.0]
  def change
    add_column :votes, :confirmation, :boolean, default: false, null: false
  end
end
