class AddSafedeleteToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :safedelete, :datetime
  end
end
