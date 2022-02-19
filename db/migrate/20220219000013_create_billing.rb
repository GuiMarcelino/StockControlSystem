class CreateBilling < ActiveRecord::Migration[5.0]
  def change
    create_table :billing do |t|
      t.string :name
      t.text :description
      t.float :value

      t.timestamps
    end
  end
end
