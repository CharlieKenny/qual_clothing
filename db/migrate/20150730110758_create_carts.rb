class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.references :product, index: true, foreign_key: true
      t.decimal :unit_price, precision: 12, scale: 2
      t.integer :quantity
      t.integer :discount
      t.decimal :total_price, precision: 12, scale: 2

      t.timestamps null: false
    end
  end
end
