class AddPosColToAsset < ActiveRecord::Migration[5.0]
  def change
    add_column :assets, :position, :integer, default: 0

    execute("UPDATE assets SET position = 0")
  end
end
