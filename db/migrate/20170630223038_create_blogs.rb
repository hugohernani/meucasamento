class CreateBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :blogs do |t|
      t.references :event, foreign_key: true, index: true

      t.timestamps
    end
  end
end
