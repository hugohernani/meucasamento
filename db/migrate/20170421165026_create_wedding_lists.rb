class CreateWeddingLists < ActiveRecord::Migration[5.0]
  def change
    create_table :wedding_lists do |t|
      t.references :wedding_support, foreign_key: true, index: true

      t.timestamps
    end
  end
end
