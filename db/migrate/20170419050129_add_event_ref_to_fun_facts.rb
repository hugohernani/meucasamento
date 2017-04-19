class AddEventRefToFunFacts < ActiveRecord::Migration[5.0]
  def change
    add_reference :fun_facts, :event, polymorphic: true, index: true
  end
end
