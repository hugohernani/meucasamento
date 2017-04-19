class CreateFunFacts < ActiveRecord::Migration[5.0]
  def change
    create_table :fun_facts do |t|
      t.integer :invited_people_count
      t.integer :involved_people_count
      t.integer :worked_hours
      t.integer :cups_of_coffee_count

      t.timestamps
    end
  end
end
