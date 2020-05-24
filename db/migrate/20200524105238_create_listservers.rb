class CreateListservers < ActiveRecord::Migration[6.0]
  def change
    create_table :listservers do |t|
      t.string :title
      t.string :urlServer
      t.datetime :dateStart
      t.decimal :rating
      t.boolean :publish

      t.timestamps
    end
  end
end
