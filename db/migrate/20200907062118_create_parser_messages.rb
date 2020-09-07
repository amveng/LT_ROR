class CreateParserMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :parser_messages do |t|
      t.string :name
      t.string :typemsg
      t.string :body

      t.timestamps
    end
  end
end
