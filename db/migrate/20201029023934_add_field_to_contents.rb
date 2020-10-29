class AddFieldToContents < ActiveRecord::Migration[6.0]
  def change
    add_column :contents, :navbar_publish, :boolean, default: false
  end
end
