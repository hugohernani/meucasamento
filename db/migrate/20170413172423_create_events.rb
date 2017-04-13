class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.integer :event_type, default: 0
      t.datetime :celebration_date

      t.timestamps
    end
  end
end
