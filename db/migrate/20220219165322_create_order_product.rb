class CreateOrderProduct < ActiveRecord::Migration[5.0]
  def change
    create_table :order_product do |t|
      t.references :orderes, foreign_key: true
      t.references :product, foreign_key: true
      t.float :value

      t.timestamps
    end
  end
end
