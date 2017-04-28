class CreateProductHandlings < ActiveRecord::Migration[5.0]
  def change
    create_table :product_handlings do |t|
      t.references :product, foreign_key: true, index: true
      t.string :buyer_name
      t.string :phone_number
      t.datetime :bought_date

      t.timestamps
    end
  end
end
