class CreateWeddingParents < ActiveRecord::Migration[5.0]
  def change
    create_table :wedding_parents do |t|
      t.references :fiance, index: true, foreign_key: { to_table: :accounts}
      t.string :father_name
      t.text :father_description
      t.string :mother_name
      t.text :mother_description

      t.timestamps
    end
  end
end
