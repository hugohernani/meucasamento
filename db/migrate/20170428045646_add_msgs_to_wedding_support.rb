class AddMsgsToWeddingSupport < ActiveRecord::Migration[5.0]
  def change
    add_column :wedding_supports, :donations_message, :text
    add_column :wedding_supports, :gifts_message, :text
    add_column :wedding_supports, :deposit_message, :text
  end
end
