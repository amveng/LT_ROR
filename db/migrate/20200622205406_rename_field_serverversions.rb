class RenameFieldServerversions < ActiveRecord::Migration[6.0]
  def change
    remove_column :serverversions, :hronicle
    add_column :serverversions, :name, :string
  end
end
