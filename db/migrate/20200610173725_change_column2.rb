class ChangeColumn2 < ActiveRecord::Migration[6.0]
  def change
    change_column(:users, :provider, :string, limit: 50, null: false, default: 'email')
  end
end
