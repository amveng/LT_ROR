class AddFieldUserModel < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :votetime, :datetime, null: false, default: '2020-01-01'
  end
end
