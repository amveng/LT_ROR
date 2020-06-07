# frozen_string_literal: true

class UpdateUsers < ActiveRecord::Migration[6.0]
  def change
    add_column(:users, :provider, :string, limit: 50, null: false, default: '')
    add_column(:users, :uid, :string, limit: 200, null: false, default: '')
    add_column(:users, :username, :string, limit: 50, null: false, default: '')
  end
end
