class CreateAddReferences < ActiveRecord::Migration[6.0]
  def change
    add_reference :listservers, :user, foreign_key: true
  end
end