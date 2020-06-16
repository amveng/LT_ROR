class CreatePolls < ActiveRecord::Migration[6.0]
  def change
    create_table :polls do |t|
      t.belongs_to :listserver
      t.integer :votecount, default: 0, null: false

      t.timestamps
    end
  end
end
