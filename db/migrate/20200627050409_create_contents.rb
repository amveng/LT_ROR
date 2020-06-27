class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.string :title
      t.string :header
      t.string :subheader
      t.text :body

      t.timestamps
    end
  end
end
