class AddTypeAttrToEventImage < ActiveRecord::Migration[5.0]
  def change
    add_column :event_images, :type, :string
    remove_column :event_images, :res_type, :integer
  end
end
