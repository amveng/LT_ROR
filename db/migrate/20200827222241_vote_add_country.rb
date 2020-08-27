class VoteAddCountry < ActiveRecord::Migration[6.0]
  def change
    add_column :votes, :country, :string, default: 'ru'
  end
end
