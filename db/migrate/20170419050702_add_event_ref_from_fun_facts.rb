class AddEventRefFromFunFacts < ActiveRecord::Migration[5.0]
  def change
    add_reference :fun_facts, :event, foreign_key: true, index: true
  end
end
