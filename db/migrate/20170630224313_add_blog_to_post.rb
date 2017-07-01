class AddBlogToPost < ActiveRecord::Migration[5.0]
  def change
    add_reference :posts, :blog, foreign_key: true, index: true
  end
end
