class Addfield2 < ActiveRecord::Migration[6.0]
  def change
    add_column :servers, :version, :string
  end
end
