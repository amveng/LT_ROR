class ChangeColumnserversPublish < ActiveRecord::Migration[6.0]
  def change
    change_column :servers, :publish, :string, default: 'create', null: false
  end
end
