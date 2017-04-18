class CreateEventImages < ActiveRecord::Migration[5.0]
  def change
    create_table :event_images do |t|
      t.references :event, foreign_key: true, index: true
      t.integer :res_type, default: 0

      t.timestamps
    end
  end
end
