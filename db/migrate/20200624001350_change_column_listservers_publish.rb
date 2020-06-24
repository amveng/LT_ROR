class ChangeColumnListserversPublish < ActiveRecord::Migration[6.0]
  def change
    change_column :listservers, :publish, :string, default: 'create', null: false
  end
end
