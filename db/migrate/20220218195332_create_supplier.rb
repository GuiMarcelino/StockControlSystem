class CreateSupplier < ActiveRecord::Migration[5.0]
  def change
    create_table :supplieres do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :site

      t.timestamps
    end
  end
end
