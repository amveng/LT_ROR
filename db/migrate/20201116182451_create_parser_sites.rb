class CreateParserSites < ActiveRecord::Migration[6.0]
  def change
    create_table :parser_sites do |t|
      t.string :url
      t.boolean :enabled, default: false, null: false

      t.timestamps
    end
  end
end
