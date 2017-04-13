class AddTenantNameAttrToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :tenant_name, :string
  end
end
