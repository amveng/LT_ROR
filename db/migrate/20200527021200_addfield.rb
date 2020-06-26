# frozen_string_literal: true

class Addfield < ActiveRecord::Migration[6.0]
  def change
    add_reference :servers, :serverversion, null: false, default: 1, foreign_key: true
  end
end
