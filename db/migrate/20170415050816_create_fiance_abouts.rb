class CreateFianceAbouts < ActiveRecord::Migration[5.0]
  def change
    create_table :fiance_abouts do |t|
      t.text :content
      t.references :fiance, index: true, foreign_key: {to_table: :accounts}

      t.timestamps
    end
  end
end
