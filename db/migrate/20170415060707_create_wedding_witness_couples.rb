class CreateWeddingWitnessCouples < ActiveRecord::Migration[5.0]
  def change
    create_table :wedding_witness_couples do |t|
      t.string :male_name
      t.text :male_description
      t.string :female_name
      t.text :female_description
      t.references :fiance, index: true, foreign_key: { to_table: :accounts }

      t.timestamps
    end
  end
end
