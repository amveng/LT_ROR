class AddLtcForProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :ltc, :decimal, default: '0.0'
  end
end
