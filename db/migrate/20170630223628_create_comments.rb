class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :commentable, polymorphic: true, index: true
      t.string :name
      t.string :email
      t.text :content

      t.timestamps
    end
  end
end
