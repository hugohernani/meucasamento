class AddProductRefToDonation < ActiveRecord::Migration[5.0]
  def change
    add_reference :donations, :product, foreign_key: true, index: true
  end
end
