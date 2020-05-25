class DelField5 < ActiveRecord::Migration[6.0]
  def change
    remove_column :listservers, :version_id
  end
end
