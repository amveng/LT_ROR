class CreatePetitions < ActiveRecord::Migration[6.0]
  def change
    create_table :petitions do |t|
      t.string :topic
      t.text :body
      t.string :target
      t.references :user
      t.string :status
      t.text :answer

      t.timestamps
    end
  end
end
