class AddCaptureDateToAsset < ActiveRecord::Migration[5.0]
  def change
    add_column :assets, :capture, :datetime, default: DateTime.now
  end
end
