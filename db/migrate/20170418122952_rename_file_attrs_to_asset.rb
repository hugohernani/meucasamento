class RenameFileAttrsToAsset < ActiveRecord::Migration[5.0]
  def change
    rename_column :assets, :file_id, :attachment_file_id
    rename_column :assets, :file_filename, :attachment_file_name
    rename_column :assets, :file_content_type, :attachment_content_type
    remove_column :assets, :file_size
    add_column    :assets, :attachment_file_size, :integer
    add_column    :assets, :attachment_updated_at, :datetime
  end
end
