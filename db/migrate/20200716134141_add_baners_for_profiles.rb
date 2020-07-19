class AddBanersForProfiles < ActiveRecord::Migration[6.0]
  def change
    change_table :profiles do |t|
      t.date :baner_top_date_start
      t.date :baner_top_date_end
      t.string :baner_top_img
      t.string :baner_top_url
      t.string :baner_top_status, default: 'undefined'
      t.date :baner_menu_date_start
      t.date :baner_menu_date_end
      t.string :baner_menu_img
      t.string :baner_menu_url
      t.string :baner_menu_status, default: 'undefined'
    end
  end
end
