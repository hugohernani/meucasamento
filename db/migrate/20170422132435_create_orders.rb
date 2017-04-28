class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :donation, foreign_key: true
      t.integer :price
      t.string :status
      t.string :buyer_name
      t.string :reference

      t.timestamps
    end
  end
end
