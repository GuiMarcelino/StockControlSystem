class CreateOrderes < ActiveRecord::Migration[5.0]
  def change
    create_table :orderes do |t|
      t.references :client, foreign_key: true
      t.float :value_total

      t.timestamps
    end
  end
end
