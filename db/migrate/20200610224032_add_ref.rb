class AddRef < ActiveRecord::Migration[6.0]
  def change
    add_reference :listservers, :user
  end
end