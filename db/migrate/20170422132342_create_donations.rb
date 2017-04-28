class CreateDonations < ActiveRecord::Migration[5.0]
  def change
    create_table :donations do |t|
      t.string :title
      t.decimal :price, precision: 10, scale: 2
      t.text :description

      t.timestamps
    end
  end
end
