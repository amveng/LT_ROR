class VoteChangeCountry2 < ActiveRecord::Migration[6.0]
  def change
    remove_column :votes, :country
    add_column :votes, :country, :string
  end
end
