class AddSocialNameToAccount < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :social_name, :string
  end
end
