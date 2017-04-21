class CreateWeddingSupports < ActiveRecord::Migration[5.0]
  def change
    create_table :wedding_supports do |t|
      t.references :event, foreign_key: true, index: true
      t.text :message

      t.timestamps
    end
  end
end
