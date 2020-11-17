class CreateParserSites < ActiveRecord::Migration[6.0]
  def change
    create_table :parser_sites do |t|
      t.string :url, null: false
      t.string :css_selector, null: false
      t.integer :number_name, default: 0, null: false
      t.integer :number_date, default: 0, null: false
      t.integer :number_rate, default: 0, null: false
      t.boolean :enabled, default: false, null: false

      t.timestamps
    end
  end
end
