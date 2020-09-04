class AddDetailsToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :last_product, :string
    add_column :profiles, :last_description, :string
  end
end
