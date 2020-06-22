class AddReferenceListserversForServerversions < ActiveRecord::Migration[6.0]
  def change
    add_reference :listservers, :serverversion, null: false, default: 1
    remove_column :listservers, :version
  end
end
