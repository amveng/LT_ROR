class CreateServerversions < ActiveRecord::Migration[6.0]
  def change
    create_table :serverversions do |t|
      t.string :hronicle

      t.timestamps
    end
  end
end
