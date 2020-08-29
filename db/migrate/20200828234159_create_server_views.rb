class CreateServerViews < ActiveRecord::Migration[6.0]
  def change
    create_table :server_views do |t|
      t.belongs_to :server
      t.string :viewer
      t.date :date
    end
  end
end
