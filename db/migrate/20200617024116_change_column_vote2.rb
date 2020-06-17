class ChangeColumnVote2 < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.belongs_to :listserver
      t.belongs_to :user
      t.date :date

      t.timestamps
    end
  end
end
