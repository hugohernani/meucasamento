class RemoveEventRefFromFunFacts < ActiveRecord::Migration[5.0]
  def change
    remove_reference :fun_facts, :event, index: true
  end
end
