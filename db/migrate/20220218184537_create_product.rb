class CreateProduct < ActiveRecord::Migration[5.0]
  def change
    create_table :product do |t|
      t.string :name
      t.text :description
      t.integer :amount
      t.datetime :due_date
      t.float :value_buy
      t.float :value_sale

      t.timestamps
    end
  end
end
