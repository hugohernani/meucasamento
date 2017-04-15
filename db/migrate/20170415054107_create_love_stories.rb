class CreateLoveStories < ActiveRecord::Migration[5.0]
  def change
    create_table :love_stories do |t|
      t.text :we_met
      t.text :first_date
      t.text :engagement
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
