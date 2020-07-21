class ChangeContentsField < ActiveRecord::Migration[6.0]
  def change
    add_column :contents, :menu_publish, :boolean, default: false, null: false
    rename_column :contents, :subheader, :menu
  end
end