class RemoveEventTypeFromFunFacts < ActiveRecord::Migration[5.0]
  def change
    remove_column :fun_facts, :event_type, :string
  end
end
