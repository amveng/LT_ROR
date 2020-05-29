class CreateAddfields < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|

      t.timestamps null: false
    end
  end
end
