class CreatePrices < ActiveRecord::Migration[6.0]
  def change
    create_table :prices do |t|
      t.decimal :plan_price
      t.references :plan, null: false, foreign_key: true
      t.references :periodicity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
