class AddCallMsgsToWeddingSupport < ActiveRecord::Migration[5.0]
  def change
    add_column :wedding_supports, :deposit_call_message, :text
    add_column :wedding_supports, :donations_call_message, :text
    add_column :wedding_supports, :gifts_call_message, :text
  end
end
