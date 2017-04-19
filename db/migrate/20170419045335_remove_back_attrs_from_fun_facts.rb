class RemoveBackAttrsFromFunFacts < ActiveRecord::Migration[5.0]
  def change
    remove_column :fun_facts, :background_image_file_name, :string
    remove_column :fun_facts, :background_image_content_type, :string
    remove_column :fun_facts, :background_image_file_size, :integer
    remove_column :fun_facts, :background_image_updated_at, :datetime
  end
end
