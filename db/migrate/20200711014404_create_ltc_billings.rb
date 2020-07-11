class CreateLtcBillings < ActiveRecord::Migration[6.0]
  def change
    create_table :ltc_billings do |t|
      t.references :user
      t.decimal :amount
      t.string :description
      t.string :product_name

      t.timestamps
    end
  end
end
