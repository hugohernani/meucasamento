class AddThemeRefToEvent < ActiveRecord::Migration[5.0]
  def change
    add_reference :events, :theme, foreign_key: true, index: true
  end
end
