class AddReferenceserversForServerversions < ActiveRecord::Migration[6.0]
  def change
    add_reference :servers, :serverversion, null: false, default: 1
    remove_column :servers, :version
  end
end
