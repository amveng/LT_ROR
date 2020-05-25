class AddColumn < ActiveRecord::Migration[6.0]
  def change
    add_reference :listservers, :serverversion
  end
end
