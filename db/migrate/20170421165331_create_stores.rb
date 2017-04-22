class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.references :wedding_list, foreign_key: true, index: true
      t.string :name
      t.text :address
      t.string :phone_number

      t.timestamps
    end
  end
end
