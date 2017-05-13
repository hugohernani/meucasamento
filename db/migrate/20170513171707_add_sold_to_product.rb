class AddSoldToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :sold, :boolean, default: false
  end
end
