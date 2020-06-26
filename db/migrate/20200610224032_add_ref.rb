class AddRef < ActiveRecord::Migration[6.0]
  def change
    add_reference :servers, :user
  end
end
