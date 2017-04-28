class AddWeddingListToDonation < ActiveRecord::Migration[5.0]
  def change
    add_reference :donations, :wedding_list, foreign_key: true, index: true
  end
end
