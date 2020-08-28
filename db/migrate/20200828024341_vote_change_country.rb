class VoteChangeCountry < ActiveRecord::Migration[6.0]
  def change
    change_column :votes, :country, :string, default: 'Russian Federation'
  end
end
