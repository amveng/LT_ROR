class AddColumn5 < ActiveRecord::Migration[6.0]
  def change
    add_reference :listservers, :version
  end
end
