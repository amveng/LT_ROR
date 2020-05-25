class AddColumn6 < ActiveRecord::Migration[6.0]
  def change
    add_reference :listservers, :serverversion, null: false, default: 1, foreign_key: true
  end
end
