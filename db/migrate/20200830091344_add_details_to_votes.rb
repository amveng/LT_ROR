class AddDetailsToVotes < ActiveRecord::Migration[6.0]
  def change
    add_column :votes, :token, :string
    add_column :votes, :user_ip, :string
  end
end
