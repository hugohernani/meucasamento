class AddAttrsToStore < ActiveRecord::Migration[5.0]
  def change
    add_column :stores, :no_products, :boolean
    add_column :stores, :instructions, :text
  end
end
