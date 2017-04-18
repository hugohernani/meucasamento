class CreateAssets < ActiveRecord::Migration[5.0]
  def change
    create_table :assets do |t|
      t.references :owner, polymorphic: true, index: true
      t.string :file_id
      t.string :file_filename
      t.string :file_content_type
      t.string :file_size

      t.timestamps
    end
  end
end
