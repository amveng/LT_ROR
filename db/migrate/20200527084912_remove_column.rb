class RemoveColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :servers, :serverversion_id
  end
end
