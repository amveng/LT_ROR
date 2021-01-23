# frozen_string_literal: true

class CreateBanners < ActiveRecord::Migration[6.0]
  def change
    create_table :banners do |t|
      t.integer :position,     null: false, default: 0
      t.integer :publish,      null: false, default: 0
      t.string :banner_image,  null: false
      t.date :date_start,      null: false
      t.date :date_end,        null: false
      t.references :server
      t.references :user

      t.timestamps
    end
  end
end
