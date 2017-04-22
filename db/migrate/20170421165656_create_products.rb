class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.references :store, foreign_key: true, index: true
      t.string :name
      t.decimal :price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
